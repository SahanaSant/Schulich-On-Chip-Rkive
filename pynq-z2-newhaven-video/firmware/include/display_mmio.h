#ifndef DISPLAY_MMIO_H
#define DISPLAY_MMIO_H

#include <stdbool.h>
#include <stdint.h>

enum {
    DISPLAY_REG_CONTROL = 0x00u,
    DISPLAY_REG_STATUS  = 0x04u
};

enum {
    DISPLAY_CONTROL_START        = 1u << 0,
    DISPLAY_CONTROL_CLEAR_STATUS = 1u << 1,
    DISPLAY_STATUS_BUSY          = 1u << 0,
    DISPLAY_STATUS_DONE          = 1u << 1,
    DISPLAY_STATUS_INIT_DONE     = 1u << 2,
    DISPLAY_STATUS_ERROR         = 1u << 3
};

typedef struct {
    uintptr_t base_address;
    uint32_t timeout_iterations;
} display_mmio_t;

void display_mmio_init(display_mmio_t *display,
                       uintptr_t base_address,
                       uint32_t timeout_iterations);
uint32_t display_mmio_status(const display_mmio_t *display);
bool display_mmio_wait_initialized(const display_mmio_t *display);
bool display_mmio_show_frame(const display_mmio_t *display);

#endif
