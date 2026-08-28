#include "framebuffer.h"

#include "video_config.h"

void framebuffer_init(framebuffer_t *framebuffer,
                      uintptr_t base_address,
                      size_t size_bytes)
{
    framebuffer->base_address = base_address;
    framebuffer->size_bytes = size_bytes;
}

bool framebuffer_write_rgb565le(framebuffer_t *framebuffer,
                                size_t destination_offset,
                                const uint8_t *source,
                                size_t byte_count)
{
    size_t index;

    if ((source == 0) || ((destination_offset & 3u) != 0u) ||
        ((byte_count & 3u) != 0u) ||
        (destination_offset > framebuffer->size_bytes) ||
        (byte_count > (framebuffer->size_bytes - destination_offset))) {
        return false;
    }

    for (index = 0u; index < byte_count; index += 4u) {
        uint32_t two_pixels =
            ((uint32_t)source[index + 0u] << 0)  |
            ((uint32_t)source[index + 1u] << 8)  |
            ((uint32_t)source[index + 2u] << 16) |
            ((uint32_t)source[index + 3u] << 24);
        *(volatile uint32_t *)(framebuffer->base_address +
                              destination_offset + index) = two_pixels;
    }

    return true;
}

void framebuffer_fill(framebuffer_t *framebuffer, uint16_t rgb565)
{
    size_t offset;
    uint32_t pair = (uint32_t)rgb565 | ((uint32_t)rgb565 << 16);

    for (offset = 0u; offset < VIDEO_BYTES_PER_FRAME; offset += 4u) {
        *(volatile uint32_t *)(framebuffer->base_address + offset) = pair;
    }
}

void framebuffer_color_bars(framebuffer_t *framebuffer)
{
    static const uint16_t colors[] = {
        RGB565_WHITE, RGB565_RED, RGB565_GREEN, RGB565_BLUE,
        (uint16_t)0xFFE0u, (uint16_t)0xF81Fu,
        (uint16_t)0x07FFu, RGB565_BLACK
    };
    uint32_t y;
    uint32_t x;

    for (y = 0u; y < VIDEO_HEIGHT_PIXELS; ++y) {
        for (x = 0u; x < VIDEO_WIDTH_PIXELS; x += 2u) {
            uint16_t left = colors[(x * 8u) / VIDEO_WIDTH_PIXELS];
            uint16_t right = colors[((x + 1u) * 8u) /
                                    VIDEO_WIDTH_PIXELS];
            uint32_t pair = (uint32_t)left | ((uint32_t)right << 16);
            size_t offset = ((size_t)y * VIDEO_WIDTH_PIXELS + x) * 2u;
            *(volatile uint32_t *)(framebuffer->base_address + offset) = pair;
        }
    }
}
