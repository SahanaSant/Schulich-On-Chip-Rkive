#include "display_mmio.h"

static volatile uint32_t *display_register(const display_mmio_t *display,
                                           uint32_t offset)
{
    return (volatile uint32_t *)(display->base_address + (uintptr_t)offset);
}

void display_mmio_init(display_mmio_t *display,
                       uintptr_t base_address,
                       uint32_t timeout_iterations)
{
    display->base_address = base_address;
    display->timeout_iterations = timeout_iterations;
    *display_register(display, DISPLAY_REG_CONTROL) =
        DISPLAY_CONTROL_CLEAR_STATUS;
}

uint32_t display_mmio_status(const display_mmio_t *display)
{
    return *display_register(display, DISPLAY_REG_STATUS);
}

bool display_mmio_wait_initialized(const display_mmio_t *display)
{
    uint32_t remaining = display->timeout_iterations;

    do {
        uint32_t status = display_mmio_status(display);
        if ((status & DISPLAY_STATUS_ERROR) != 0u) {
            return false;
        }
        if ((status & DISPLAY_STATUS_INIT_DONE) != 0u) {
            return true;
        }
        --remaining;
    } while (remaining != 0u);

    return false;
}

bool display_mmio_show_frame(const display_mmio_t *display)
{
    uint32_t remaining = display->timeout_iterations;

    *display_register(display, DISPLAY_REG_CONTROL) =
        DISPLAY_CONTROL_CLEAR_STATUS;
    *display_register(display, DISPLAY_REG_CONTROL) = DISPLAY_CONTROL_START;

    do {
        uint32_t status = display_mmio_status(display);
        if ((status & DISPLAY_STATUS_ERROR) != 0u) {
            return false;
        }
        if (((status & DISPLAY_STATUS_DONE) != 0u) &&
            ((status & DISPLAY_STATUS_BUSY) == 0u)) {
            return true;
        }
        --remaining;
    } while (remaining != 0u);

    return false;
}
