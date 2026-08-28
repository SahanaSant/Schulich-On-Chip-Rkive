#ifndef FRAMEBUFFER_H
#define FRAMEBUFFER_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

typedef struct {
    uintptr_t base_address;
    size_t size_bytes;
} framebuffer_t;

void framebuffer_init(framebuffer_t *framebuffer,
                      uintptr_t base_address,
                      size_t size_bytes);
bool framebuffer_write_rgb565le(framebuffer_t *framebuffer,
                                size_t destination_offset,
                                const uint8_t *source,
                                size_t byte_count);
void framebuffer_fill(framebuffer_t *framebuffer, uint16_t rgb565);
void framebuffer_color_bars(framebuffer_t *framebuffer);

#endif
