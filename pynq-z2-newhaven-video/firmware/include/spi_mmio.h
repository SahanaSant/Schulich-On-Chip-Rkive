#ifndef SPI_MMIO_H
#define SPI_MMIO_H

#include <stdbool.h>
#include <stdint.h>

enum {
    SPI_REG_CONTROL = 0x00u,
    SPI_REG_STATUS  = 0x04u,
    SPI_REG_CLK_DIV = 0x08u,
    SPI_REG_TX_DATA = 0x0Cu,
    SPI_REG_RX_DATA = 0x10u
};

enum {
    SPI_CONTROL_START     = 1u << 0,
    SPI_CONTROL_CS_ASSERT = 1u << 1,
    SPI_STATUS_BUSY       = 1u << 0,
    SPI_STATUS_DONE       = 1u << 1,
    SPI_STATUS_RX_VALID   = 1u << 2
};

typedef struct {
    uintptr_t base_address;
    uint32_t input_clock_hz;
    uint32_t timeout_iterations;
    bool chip_selected;
} spi_mmio_t;

void spi_mmio_init(spi_mmio_t *spi,
                   uintptr_t base_address,
                   uint32_t input_clock_hz,
                   uint32_t timeout_iterations);
bool spi_mmio_set_frequency(spi_mmio_t *spi, uint32_t requested_hz);
void spi_mmio_set_chip_select(spi_mmio_t *spi, bool selected);
bool spi_mmio_transfer_byte(spi_mmio_t *spi, uint8_t tx, uint8_t *rx);

#endif
