#include "spi_mmio.h"

static volatile uint32_t *spi_register(const spi_mmio_t *spi,
                                       uint32_t offset)
{
    return (volatile uint32_t *)(spi->base_address + (uintptr_t)offset);
}

void spi_mmio_init(spi_mmio_t *spi,
                   uintptr_t base_address,
                   uint32_t input_clock_hz,
                   uint32_t timeout_iterations)
{
    spi->base_address = base_address;
    spi->input_clock_hz = input_clock_hz;
    spi->timeout_iterations = timeout_iterations;
    spi->chip_selected = false;
    *spi_register(spi, SPI_REG_CONTROL) = 0u;
}

bool spi_mmio_set_frequency(spi_mmio_t *spi, uint32_t requested_hz)
{
    uint32_t divider;

    if ((requested_hz == 0u) || (spi->input_clock_hz == 0u)) {
        return false;
    }

    /* SCLK = input_clock / (2 * CLK_DIV). Round upward so the requested
       frequency is never exceeded. */
    divider = (spi->input_clock_hz + (2u * requested_hz) - 1u) /
              (2u * requested_hz);
    if (divider == 0u) {
        divider = 1u;
    }
    if (divider > 0xFFFFu) {
        return false;
    }

    *spi_register(spi, SPI_REG_CLK_DIV) = divider;
    return true;
}

void spi_mmio_set_chip_select(spi_mmio_t *spi, bool selected)
{
    spi->chip_selected = selected;
    *spi_register(spi, SPI_REG_CONTROL) =
        selected ? SPI_CONTROL_CS_ASSERT : 0u;
}

bool spi_mmio_transfer_byte(spi_mmio_t *spi, uint8_t tx, uint8_t *rx)
{
    uint32_t control;
    uint32_t remaining;
    uint32_t status;

    *spi_register(spi, SPI_REG_TX_DATA) = (uint32_t)tx;
    control = SPI_CONTROL_START;
    if (spi->chip_selected) {
        control |= SPI_CONTROL_CS_ASSERT;
    }
    *spi_register(spi, SPI_REG_CONTROL) = control;

    remaining = spi->timeout_iterations;
    do {
        status = *spi_register(spi, SPI_REG_STATUS);
        if ((status & (SPI_STATUS_DONE | SPI_STATUS_RX_VALID)) ==
            (SPI_STATUS_DONE | SPI_STATUS_RX_VALID)) {
            if (rx != 0) {
                *rx = (uint8_t)*spi_register(spi, SPI_REG_RX_DATA);
            }
            return true;
        }
        --remaining;
    } while (remaining != 0u);

    return false;
}
