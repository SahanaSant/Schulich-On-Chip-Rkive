#include "fatfs_diskio.h"

#include "ff.h"
#include "diskio.h"

static sd_spi_card_t *attached_card;

void fatfs_diskio_attach(sd_spi_card_t *card)
{
    attached_card = card;
}

DSTATUS disk_status(BYTE physical_drive)
{
    if ((physical_drive != 0u) || (attached_card == 0) ||
        !attached_card->initialized) {
        return STA_NOINIT;
    }
    return 0u;
}

DSTATUS disk_initialize(BYTE physical_drive)
{
    if ((physical_drive != 0u) || (attached_card == 0)) {
        return STA_NOINIT;
    }
    return sd_spi_initialize(attached_card) ? 0u : STA_NOINIT;
}

DRESULT disk_read(BYTE physical_drive,
                  BYTE *buffer,
                  LBA_t sector,
                  UINT sector_count)
{
    if ((physical_drive != 0u) || (attached_card == 0) ||
        !attached_card->initialized) {
        return RES_NOTRDY;
    }
    if ((buffer == 0) || (sector_count == 0u) ||
        (sector > (LBA_t)UINT32_MAX) ||
        (sector_count > (UINT)UINT32_MAX)) {
        return RES_PARERR;
    }

    return sd_spi_read_sectors(attached_card,
                               (uint32_t)sector,
                               buffer,
                               (uint32_t)sector_count)
         ? RES_OK : RES_ERROR;
}

#if FF_FS_READONLY == 0
DRESULT disk_write(BYTE physical_drive,
                   const BYTE *buffer,
                   LBA_t sector,
                   UINT sector_count)
{
    (void)physical_drive;
    (void)buffer;
    (void)sector;
    (void)sector_count;
    return RES_WRPRT;
}
#endif

DRESULT disk_ioctl(BYTE physical_drive, BYTE command, void *buffer)
{
    if ((physical_drive != 0u) || (attached_card == 0) ||
        !attached_card->initialized) {
        return RES_NOTRDY;
    }

    switch (command) {
    case CTRL_SYNC:
        return RES_OK;
    case GET_SECTOR_SIZE:
        if (buffer == 0) {
            return RES_PARERR;
        }
        *(WORD *)buffer = 512u;
        return RES_OK;
    case GET_BLOCK_SIZE:
        if (buffer == 0) {
            return RES_PARERR;
        }
        *(DWORD *)buffer = 1u;
        return RES_OK;
    default:
        /* Playback does not need card capacity or erase operations. */
        return RES_PARERR;
    }
}

DWORD get_fattime(void)
{
    /* No RTC is required for a read-only video player. */
    return 0u;
}
