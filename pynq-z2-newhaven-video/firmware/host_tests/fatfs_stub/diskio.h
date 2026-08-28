#ifndef HOST_TEST_DISKIO_H
#define HOST_TEST_DISKIO_H

#include <stdint.h>

#define FF_FS_READONLY 1

typedef uint8_t BYTE;
typedef uint16_t WORD;
typedef uint32_t DWORD;
typedef unsigned int UINT;
typedef uint64_t LBA_t;
typedef BYTE DSTATUS;

typedef enum {
    RES_OK = 0,
    RES_ERROR,
    RES_WRPRT,
    RES_NOTRDY,
    RES_PARERR
} DRESULT;

#define STA_NOINIT      0x01u
#define CTRL_SYNC       0u
#define GET_SECTOR_COUNT 1u
#define GET_SECTOR_SIZE 2u
#define GET_BLOCK_SIZE  3u

DSTATUS disk_initialize(BYTE physical_drive);
DSTATUS disk_status(BYTE physical_drive);
DRESULT disk_read(BYTE physical_drive, BYTE *buffer,
                  LBA_t sector, UINT sector_count);
DRESULT disk_ioctl(BYTE physical_drive, BYTE command, void *buffer);
DWORD get_fattime(void);

#endif
