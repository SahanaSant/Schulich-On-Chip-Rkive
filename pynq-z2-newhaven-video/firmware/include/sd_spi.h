#ifndef SD_SPI_H
#define SD_SPI_H

#include <stdbool.h>
#include <stdint.h>

#include "spi_mmio.h"

typedef struct {
    void *context;
    bool (*set_frequency)(void *context, uint32_t frequency_hz);
    void (*set_chip_select)(void *context, bool selected);
    bool (*transfer_byte)(void *context, uint8_t tx, uint8_t *rx);
    void (*delay_ms)(void *context, uint32_t milliseconds);
} sd_spi_bus_t;

typedef struct {
    sd_spi_bus_t bus;
    bool initialized;
    bool high_capacity;
} sd_spi_card_t;

void sd_spi_bus_from_mmio(sd_spi_bus_t *bus, spi_mmio_t *spi);
void sd_spi_card_init(sd_spi_card_t *card, const sd_spi_bus_t *bus);
bool sd_spi_initialize(sd_spi_card_t *card);
bool sd_spi_read_sector(sd_spi_card_t *card,
                        uint32_t logical_block_address,
                        uint8_t destination[512]);
bool sd_spi_read_sectors(sd_spi_card_t *card,
                         uint32_t first_logical_block_address,
                         uint8_t *destination,
                         uint32_t sector_count);

#endif
