#ifndef FATFS_DISKIO_ADAPTER_H
#define FATFS_DISKIO_ADAPTER_H

#include "sd_spi.h"

/* Attach the one SD card used by FatFs drive 0. Call this before f_mount(). */
void fatfs_diskio_attach(sd_spi_card_t *card);

#endif
