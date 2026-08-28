#ifndef VIDEO_CONFIG_H
#define VIDEO_CONFIG_H

#include <stdint.h>

#define VIDEO_WIDTH_PIXELS       240u
#define VIDEO_HEIGHT_PIXELS      320u
#define VIDEO_BYTES_PER_PIXEL      2u
#define VIDEO_PIXELS_PER_FRAME \
    (VIDEO_WIDTH_PIXELS * VIDEO_HEIGHT_PIXELS)
#define VIDEO_BYTES_PER_FRAME \
    (VIDEO_PIXELS_PER_FRAME * VIDEO_BYTES_PER_PIXEL)

#define SD_SECTOR_BYTES           512u
#define VIDEO_SECTORS_PER_FRAME \
    (VIDEO_BYTES_PER_FRAME / SD_SECTOR_BYTES)

#if (VIDEO_BYTES_PER_FRAME % SD_SECTOR_BYTES) != 0
#error "A video frame must contain a whole number of SD sectors"
#endif

#define RGB565_BLACK  ((uint16_t)0x0000u)
#define RGB565_WHITE  ((uint16_t)0xFFFFu)
#define RGB565_RED    ((uint16_t)0xF800u)
#define RGB565_GREEN  ((uint16_t)0x07E0u)
#define RGB565_BLUE   ((uint16_t)0x001Fu)

#endif
