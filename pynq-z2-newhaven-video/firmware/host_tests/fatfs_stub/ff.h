#ifndef HOST_TEST_FF_H
#define HOST_TEST_FF_H

#include <stdint.h>

typedef unsigned int UINT;
typedef uint32_t FSIZE_t;
typedef struct { unsigned dummy; } FATFS;
typedef struct { unsigned dummy; } FIL;
typedef int FRESULT;

#define FR_OK   0
#define FA_READ 0x01u

FRESULT f_mount(FATFS *filesystem, const char *path, unsigned mount_now);
FRESULT f_open(FIL *file, const char *path, unsigned mode);
FRESULT f_read(FIL *file, void *buffer, UINT bytes_to_read, UINT *bytes_read);
FRESULT f_lseek(FIL *file, FSIZE_t offset);
FRESULT f_close(FIL *file);

#endif
