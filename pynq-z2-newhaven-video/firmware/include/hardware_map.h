#ifndef VIDEO_HARDWARE_MAP_H
#define VIDEO_HARDWARE_MAP_H

#include "xparameters.h"

/* These names come from the proposed Vivado instance names. If Vivado emits
   different xparameters.h names, change only this file. */
#ifndef VIDEO_SPI_BASE_ADDRESS
#if defined(XPAR_AXI_LITE_SPI_MASTER_0_BASEADDR)
#define VIDEO_SPI_BASE_ADDRESS XPAR_AXI_LITE_SPI_MASTER_0_BASEADDR
#else
#error "Define VIDEO_SPI_BASE_ADDRESS using the SPI AXI slave base address"
#endif
#endif

#ifndef VIDEO_FRAMEBUFFER_BASE_ADDRESS
#if defined(XPAR_AXI_LITE_FRAMEBUFFER_WRITER_0_BASEADDR)
#define VIDEO_FRAMEBUFFER_BASE_ADDRESS \
    XPAR_AXI_LITE_FRAMEBUFFER_WRITER_0_BASEADDR
#else
#error "Define VIDEO_FRAMEBUFFER_BASE_ADDRESS using the framebuffer AXI base"
#endif
#endif

#ifndef VIDEO_DISPLAY_CONTROL_BASE_ADDRESS
#if defined(XPAR_AXI_LITE_DISPLAY_CONTROL_0_BASEADDR)
#define VIDEO_DISPLAY_CONTROL_BASE_ADDRESS \
    XPAR_AXI_LITE_DISPLAY_CONTROL_0_BASEADDR
#elif defined(XPAR_VIDEO_DISPLAY_SUBSYSTEM_0_S_CTRL_AXI_BASEADDR)
#define VIDEO_DISPLAY_CONTROL_BASE_ADDRESS \
    XPAR_VIDEO_DISPLAY_SUBSYSTEM_0_S_CTRL_AXI_BASEADDR
#else
#error "Define VIDEO_DISPLAY_CONTROL_BASE_ADDRESS using the display-control AXI base"
#endif
#endif

#ifndef VIDEO_AXI_CLOCK_HZ
#define VIDEO_AXI_CLOCK_HZ 90000000u
#endif

#define VIDEO_FRAMEBUFFER_WINDOW_BYTES (256u * 1024u)

#endif
