#include <stdint.h>

#include "display_mmio.h"
#include "fatfs_diskio.h"
#include "fatfs_video_source.h"
#include "framebuffer.h"
#include "hardware_map.h"
#include "platform.h"
#include "sd_spi.h"
#include "spi_mmio.h"
#include "video_config.h"
#include "video_stream.h"
#include "xil_printf.h"

#define SPI_TRANSFER_TIMEOUT_ITERATIONS 1000000u
#define DISPLAY_TIMEOUT_ITERATIONS      200000000u
#define VIDEO_FILE_PATH                  "0:/VIDEO.RGB"

static uint8_t sector_buffer[SD_SECTOR_BYTES];
static fatfs_video_source_t fatfs_source;

int main(void)
{
    spi_mmio_t spi;
    sd_spi_bus_t sd_bus;
    sd_spi_card_t sd_card;
    framebuffer_t framebuffer;
    display_mmio_t display;
    video_source_t video;

    init_platform();
    xil_printf("PYNQ-Z2 external-SD video loader\r\n");

    spi_mmio_init(&spi, (uintptr_t)VIDEO_SPI_BASE_ADDRESS,
                  VIDEO_AXI_CLOCK_HZ,
                  SPI_TRANSFER_TIMEOUT_ITERATIONS);
    sd_spi_bus_from_mmio(&sd_bus, &spi);
    sd_spi_card_init(&sd_card, &sd_bus);
    fatfs_diskio_attach(&sd_card);

    framebuffer_init(&framebuffer,
                     (uintptr_t)VIDEO_FRAMEBUFFER_BASE_ADDRESS,
                     VIDEO_FRAMEBUFFER_WINDOW_BYTES);
    display_mmio_init(&display,
                      (uintptr_t)VIDEO_DISPLAY_CONTROL_BASE_ADDRESS,
                      DISPLAY_TIMEOUT_ITERATIONS);
    framebuffer_color_bars(&framebuffer);

    xil_printf("Waiting for Newhaven LCD initialization\r\n");
    if (!display_mmio_wait_initialized(&display)) {
        xil_printf("ERROR: LCD initialization timed out\r\n");
        cleanup_platform();
        return 1;
    }
    if (!display_mmio_show_frame(&display)) {
        xil_printf("ERROR: color-bar scanout failed\r\n");
        cleanup_platform();
        return 1;
    }
    xil_printf("Color-bar frame sent to LCD\r\n");

    xil_printf("Mounting SD card and opening %s\r\n", VIDEO_FILE_PATH);
    if (!fatfs_video_open(&fatfs_source, VIDEO_FILE_PATH)) {
        xil_printf("ERROR: SD initialization, FAT32 mount, or file open failed\r\n");
        cleanup_platform();
        return 1;
    }
    video = fatfs_video_as_source(&fatfs_source);

    for (;;) {
        if (!video_stream_one_frame(&video, &framebuffer, sector_buffer)) {
            /* Reaching EOF is expected: rewind the headerless frame file. */
            if ((video.rewind == 0) || !video.rewind(video.context) ||
                !video_stream_one_frame(&video, &framebuffer,
                                        sector_buffer)) {
                xil_printf("ERROR: could not read a complete video frame\r\n");
                break;
            }
        }
        /* The single framebuffer must not be overwritten while its pixels are
           being shifted to the LCD. This call blocks until scanout finishes. */
        if (!display_mmio_show_frame(&display)) {
            xil_printf("ERROR: LCD frame scanout failed\r\n");
            break;
        }
    }

    fatfs_video_close(&fatfs_source);
    cleanup_platform();
    return 1;
}
