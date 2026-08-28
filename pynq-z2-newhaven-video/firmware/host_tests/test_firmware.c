#include <assert.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include "framebuffer.h"
#include "diskio.h"
#include "fatfs_diskio.h"
#include "sd_spi.h"
#include "video_config.h"
#include "video_stream.h"

typedef struct {
    bool selected;
    uint32_t frequency_hz;
    uint8_t command[6];
    size_t command_length;
    uint8_t response[520];
    size_t response_length;
    size_t response_index;
    unsigned acmd41_count;
    uint8_t last_command;
    uint32_t last_argument;
} fake_sd_t;

static void queue_byte(fake_sd_t *fake, uint8_t value)
{
    assert(fake->response_length < sizeof(fake->response));
    fake->response[fake->response_length++] = value;
}

static void process_command(fake_sd_t *fake)
{
    uint8_t command = (uint8_t)(fake->command[0] & 0x3Fu);
    uint32_t argument = ((uint32_t)fake->command[1] << 24) |
                        ((uint32_t)fake->command[2] << 16) |
                        ((uint32_t)fake->command[3] << 8) |
                        (uint32_t)fake->command[4];
    size_t index;

    fake->last_command = command;
    fake->last_argument = argument;
    fake->response_length = 0u;
    fake->response_index = 0u;

    switch (command) {
    case 0u:
        queue_byte(fake, 0x01u);
        break;
    case 8u:
        queue_byte(fake, 0x01u);
        queue_byte(fake, 0x00u);
        queue_byte(fake, 0x00u);
        queue_byte(fake, 0x01u);
        queue_byte(fake, 0xAAu);
        break;
    case 55u:
        queue_byte(fake, fake->acmd41_count < 2u ? 0x01u : 0x00u);
        break;
    case 41u:
        ++fake->acmd41_count;
        queue_byte(fake, fake->acmd41_count < 2u ? 0x01u : 0x00u);
        break;
    case 58u:
        queue_byte(fake, 0x00u);
        queue_byte(fake, 0xC0u); /* powered-up and high-capacity */
        queue_byte(fake, 0xFFu);
        queue_byte(fake, 0x80u);
        queue_byte(fake, 0x00u);
        break;
    case 17u:
        queue_byte(fake, 0x00u);
        queue_byte(fake, 0xFFu);
        queue_byte(fake, 0xFEu);
        for (index = 0u; index < SD_SECTOR_BYTES; ++index) {
            queue_byte(fake, (uint8_t)(argument + (uint32_t)index));
        }
        queue_byte(fake, 0x12u);
        queue_byte(fake, 0x34u);
        break;
    default:
        queue_byte(fake, 0x04u);
        break;
    }
}

static bool fake_set_frequency(void *context, uint32_t frequency_hz)
{
    fake_sd_t *fake = context;
    fake->frequency_hz = frequency_hz;
    return true;
}

static void fake_set_cs(void *context, bool selected)
{
    fake_sd_t *fake = context;
    fake->selected = selected;
    fake->command_length = 0u;
    fake->response_length = 0u;
    fake->response_index = 0u;
}

static bool fake_transfer(void *context, uint8_t tx, uint8_t *rx)
{
    fake_sd_t *fake = context;

    *rx = 0xFFu;
    if (!fake->selected) {
        return true;
    }
    if (fake->response_index < fake->response_length) {
        *rx = fake->response[fake->response_index++];
        return true;
    }
    if ((fake->command_length == 0u) && ((tx & 0xC0u) != 0x40u)) {
        return true;
    }
    if (fake->command_length < sizeof(fake->command)) {
        fake->command[fake->command_length++] = tx;
        if (fake->command_length == sizeof(fake->command)) {
            process_command(fake);
        }
    }
    return true;
}

static void test_sd_initialization_and_read(void)
{
    fake_sd_t fake = {0};
    sd_spi_bus_t bus = {
        &fake,
        fake_set_frequency,
        fake_set_cs,
        fake_transfer,
        0
    };
    sd_spi_card_t card;
    uint8_t sector[SD_SECTOR_BYTES];
    size_t index;

    sd_spi_card_init(&card, &bus);
    assert(sd_spi_initialize(&card));
    assert(card.initialized);
    assert(card.high_capacity);
    assert(fake.frequency_hz == 10000000u);

    assert(sd_spi_read_sector(&card, 7u, sector));
    assert(fake.last_command == 17u);
    assert(fake.last_argument == 7u); /* SDHC uses block addressing. */
    for (index = 0u; index < sizeof(sector); ++index) {
        assert(sector[index] == (uint8_t)(7u + index));
    }
}

static void test_fatfs_disk_adapter(void)
{
    fake_sd_t fake = {0};
    sd_spi_bus_t bus = {
        &fake,
        fake_set_frequency,
        fake_set_cs,
        fake_transfer,
        0
    };
    sd_spi_card_t card;
    uint8_t sectors[2u * SD_SECTOR_BYTES];
    WORD sector_size = 0u;

    sd_spi_card_init(&card, &bus);
    fatfs_diskio_attach(&card);
    assert(disk_status(0u) == STA_NOINIT);
    assert(disk_initialize(0u) == 0u);
    assert(disk_status(0u) == 0u);
    assert(disk_ioctl(0u, GET_SECTOR_SIZE, &sector_size) == RES_OK);
    assert(sector_size == SD_SECTOR_BYTES);
    assert(disk_read(0u, sectors, 9u, 2u) == RES_OK);
    assert(sectors[0] == 9u);
    assert(sectors[SD_SECTOR_BYTES] == 10u);
    assert(fake.last_argument == 10u);
}

typedef struct {
    size_t offset;
} fake_video_source_t;

static bool fake_video_read(void *context,
                            uint8_t *destination,
                            size_t requested_bytes,
                            size_t *bytes_read)
{
    fake_video_source_t *source = context;
    size_t index;

    for (index = 0u; index < requested_bytes; ++index) {
        destination[index] = (uint8_t)(source->offset + index);
    }
    source->offset += requested_bytes;
    *bytes_read = requested_bytes;
    return true;
}

static bool fake_video_rewind(void *context)
{
    ((fake_video_source_t *)context)->offset = 0u;
    return true;
}

static void test_video_stream(void)
{
    uint32_t framebuffer_words[VIDEO_BYTES_PER_FRAME / 4u];
    uint8_t sector_buffer[SD_SECTOR_BYTES];
    framebuffer_t framebuffer;
    fake_video_source_t source_context = {0};
    video_source_t source = {
        &source_context,
        fake_video_read,
        fake_video_rewind
    };
    const uint8_t *framebuffer_bytes = (const uint8_t *)framebuffer_words;
    size_t index;

    memset(framebuffer_words, 0, sizeof(framebuffer_words));
    framebuffer_init(&framebuffer, (uintptr_t)framebuffer_words,
                     sizeof(framebuffer_words));
    assert(video_stream_one_frame(&source, &framebuffer, sector_buffer));
    assert(source_context.offset == VIDEO_BYTES_PER_FRAME);
    for (index = 0u; index < VIDEO_BYTES_PER_FRAME; ++index) {
        assert(framebuffer_bytes[index] == (uint8_t)index);
    }
}

int main(void)
{
    test_sd_initialization_and_read();
    test_fatfs_disk_adapter();
    test_video_stream();
    puts("PASS: SD SPI protocol and sector-to-framebuffer streaming");
    return 0;
}
