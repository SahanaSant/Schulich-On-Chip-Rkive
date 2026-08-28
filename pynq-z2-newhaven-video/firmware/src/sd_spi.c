#include "sd_spi.h"

#include <stddef.h>

#include "video_config.h"

#define SD_INIT_FREQUENCY_HZ 250000u
#define SD_DATA_FREQUENCY_HZ 10000000u
#define SD_COMMAND_RETRIES   1000u
#define SD_TOKEN_RETRIES     100000u

#define SD_R1_IDLE           0x01u
#define SD_R1_ILLEGAL_CMD    0x04u
#define SD_DATA_START_TOKEN  0xFEu

static bool mmio_set_frequency(void *context, uint32_t frequency_hz)
{
    return spi_mmio_set_frequency((spi_mmio_t *)context, frequency_hz);
}

static void mmio_set_chip_select(void *context, bool selected)
{
    spi_mmio_set_chip_select((spi_mmio_t *)context, selected);
}

static bool mmio_transfer_byte(void *context, uint8_t tx, uint8_t *rx)
{
    return spi_mmio_transfer_byte((spi_mmio_t *)context, tx, rx);
}

void sd_spi_bus_from_mmio(sd_spi_bus_t *bus, spi_mmio_t *spi)
{
    bus->context = spi;
    bus->set_frequency = mmio_set_frequency;
    bus->set_chip_select = mmio_set_chip_select;
    bus->transfer_byte = mmio_transfer_byte;
    bus->delay_ms = 0;
}

void sd_spi_card_init(sd_spi_card_t *card, const sd_spi_bus_t *bus)
{
    card->bus = *bus;
    card->initialized = false;
    card->high_capacity = false;
}

static bool transfer(sd_spi_card_t *card, uint8_t tx, uint8_t *rx)
{
    return card->bus.transfer_byte(card->bus.context, tx, rx);
}

static void deselect_and_clock(sd_spi_card_t *card)
{
    uint8_t ignored;
    card->bus.set_chip_select(card->bus.context, false);
    (void)transfer(card, 0xFFu, &ignored);
}

/* Starts a command transaction and deliberately leaves CS asserted. The
   caller can read response/data bytes before calling deselect_and_clock(). */
static bool send_command(sd_spi_card_t *card,
                         uint8_t command,
                         uint32_t argument,
                         uint8_t crc,
                         uint8_t *r1)
{
    uint8_t response = 0xFFu;
    uint32_t retry;

    deselect_and_clock(card);
    card->bus.set_chip_select(card->bus.context, true);

    if (!transfer(card, (uint8_t)(0x40u | command), &response) ||
        !transfer(card, (uint8_t)(argument >> 24), &response) ||
        !transfer(card, (uint8_t)(argument >> 16), &response) ||
        !transfer(card, (uint8_t)(argument >> 8), &response) ||
        !transfer(card, (uint8_t)argument, &response) ||
        !transfer(card, crc, &response)) {
        deselect_and_clock(card);
        return false;
    }

    for (retry = 0u; retry < SD_COMMAND_RETRIES; ++retry) {
        if (!transfer(card, 0xFFu, &response)) {
            deselect_and_clock(card);
            return false;
        }
        if ((response & 0x80u) == 0u) {
            *r1 = response;
            return true;
        }
    }

    deselect_and_clock(card);
    return false;
}

static bool send_application_command(sd_spi_card_t *card,
                                     uint32_t argument,
                                     uint8_t *r1)
{
    uint8_t response;

    if (!send_command(card, 55u, 0u, 0x01u, &response)) {
        return false;
    }
    deselect_and_clock(card);
    if (response > SD_R1_IDLE) {
        return false;
    }

    return send_command(card, 41u, argument, 0x01u, r1);
}

bool sd_spi_initialize(sd_spi_card_t *card)
{
    uint8_t response;
    uint8_t r7[4];
    uint32_t retry;
    bool version_two;

    if ((card == 0) || (card->bus.set_frequency == 0) ||
        (card->bus.set_chip_select == 0) ||
        (card->bus.transfer_byte == 0)) {
        return false;
    }

    card->initialized = false;
    card->high_capacity = false;
    if (!card->bus.set_frequency(card->bus.context,
                                 SD_INIT_FREQUENCY_HZ)) {
        return false;
    }

    /* At least 74 clocks are required before CMD0. Ten 0xFF bytes give 80. */
    card->bus.set_chip_select(card->bus.context, false);
    for (retry = 0u; retry < 10u; ++retry) {
        if (!transfer(card, 0xFFu, &response)) {
            return false;
        }
    }

    for (retry = 0u; retry < 20u; ++retry) {
        if (send_command(card, 0u, 0u, 0x95u, &response) &&
            (response == SD_R1_IDLE)) {
            break;
        }
        deselect_and_clock(card);
        if (card->bus.delay_ms != 0) {
            card->bus.delay_ms(card->bus.context, 1u);
        }
    }
    if (retry == 20u) {
        return false;
    }
    deselect_and_clock(card);

    if (!send_command(card, 8u, 0x000001AAu, 0x87u, &response)) {
        return false;
    }
    version_two = ((response & SD_R1_ILLEGAL_CMD) == 0u);
    if (version_two) {
        for (retry = 0u; retry < 4u; ++retry) {
            if (!transfer(card, 0xFFu, &r7[retry])) {
                deselect_and_clock(card);
                return false;
            }
        }
        if ((response != SD_R1_IDLE) || (r7[2] != 0x01u) ||
            (r7[3] != 0xAAu)) {
            deselect_and_clock(card);
            return false;
        }
    }
    deselect_and_clock(card);

    for (retry = 0u; retry < SD_COMMAND_RETRIES; ++retry) {
        uint32_t argument = version_two ? 0x40000000u : 0u;
        if (!send_application_command(card, argument, &response)) {
            return false;
        }
        deselect_and_clock(card);
        if (response == 0u) {
            break;
        }
        if (response != SD_R1_IDLE) {
            return false;
        }
        if (card->bus.delay_ms != 0) {
            card->bus.delay_ms(card->bus.context, 1u);
        }
    }
    if (retry == SD_COMMAND_RETRIES) {
        return false;
    }

    if (version_two) {
        uint8_t ocr[4];
        if (!send_command(card, 58u, 0u, 0x01u, &response) ||
            (response != 0u)) {
            deselect_and_clock(card);
            return false;
        }
        for (retry = 0u; retry < 4u; ++retry) {
            if (!transfer(card, 0xFFu, &ocr[retry])) {
                deselect_and_clock(card);
                return false;
            }
        }
        card->high_capacity = (ocr[0] & 0x40u) != 0u;
        deselect_and_clock(card);
    }

    if (!card->high_capacity) {
        if (!send_command(card, 16u, SD_SECTOR_BYTES, 0x01u, &response) ||
            (response != 0u)) {
            deselect_and_clock(card);
            return false;
        }
        deselect_and_clock(card);
    }

    if (!card->bus.set_frequency(card->bus.context,
                                 SD_DATA_FREQUENCY_HZ)) {
        return false;
    }
    card->initialized = true;
    return true;
}

bool sd_spi_read_sector(sd_spi_card_t *card,
                        uint32_t logical_block_address,
                        uint8_t destination[512])
{
    uint32_t argument;
    uint32_t retry;
    uint8_t response;
    uint8_t token = 0xFFu;

    if ((card == 0) || !card->initialized || (destination == 0)) {
        return false;
    }

    argument = card->high_capacity
             ? logical_block_address
             : logical_block_address * SD_SECTOR_BYTES;
    if (!send_command(card, 17u, argument, 0x01u, &response) ||
        (response != 0u)) {
        deselect_and_clock(card);
        return false;
    }

    for (retry = 0u; retry < SD_TOKEN_RETRIES; ++retry) {
        if (!transfer(card, 0xFFu, &token)) {
            deselect_and_clock(card);
            return false;
        }
        if (token == SD_DATA_START_TOKEN) {
            break;
        }
        if (token != 0xFFu) {
            deselect_and_clock(card);
            return false;
        }
    }
    if (retry == SD_TOKEN_RETRIES) {
        deselect_and_clock(card);
        return false;
    }

    for (retry = 0u; retry < SD_SECTOR_BYTES; ++retry) {
        if (!transfer(card, 0xFFu, &destination[retry])) {
            deselect_and_clock(card);
            return false;
        }
    }
    /* Clock out and currently ignore the two CRC16 bytes. */
    if (!transfer(card, 0xFFu, &response) ||
        !transfer(card, 0xFFu, &response)) {
        deselect_and_clock(card);
        return false;
    }

    deselect_and_clock(card);
    return true;
}

bool sd_spi_read_sectors(sd_spi_card_t *card,
                         uint32_t first_logical_block_address,
                         uint8_t *destination,
                         uint32_t sector_count)
{
    uint32_t index;

    if ((destination == 0) || (sector_count == 0u)) {
        return false;
    }
    for (index = 0u; index < sector_count; ++index) {
        if (!sd_spi_read_sector(card,
                                first_logical_block_address + index,
                                destination + index * SD_SECTOR_BYTES)) {
            return false;
        }
    }
    return true;
}
