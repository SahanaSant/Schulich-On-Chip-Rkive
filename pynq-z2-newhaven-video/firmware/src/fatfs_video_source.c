#include "fatfs_video_source.h"

#include <limits.h>
#include <stddef.h>

static bool read_video_bytes(void *context,
                             uint8_t *destination,
                             size_t requested_bytes,
                             size_t *bytes_read)
{
    fatfs_video_source_t *source = context;
    UINT actual = 0u;
    FRESULT result;

    if (!source->open || (requested_bytes > (size_t)UINT_MAX)) {
        return false;
    }
    result = f_read(&source->file, destination,
                    (UINT)requested_bytes, &actual);
    *bytes_read = (size_t)actual;
    return result == FR_OK;
}

static bool rewind_video(void *context)
{
    fatfs_video_source_t *source = context;
    return source->open && (f_lseek(&source->file, 0u) == FR_OK);
}

bool fatfs_video_open(fatfs_video_source_t *source, const char *path)
{
    if ((source == 0) || (path == 0)) {
        return false;
    }
    source->mounted = false;
    source->open = false;

    if (f_mount(&source->filesystem, "0:", 1u) != FR_OK) {
        return false;
    }
    source->mounted = true;
    if (f_open(&source->file, path, FA_READ) != FR_OK) {
        (void)f_mount(0, "0:", 0u);
        source->mounted = false;
        return false;
    }
    source->open = true;
    return true;
}

void fatfs_video_close(fatfs_video_source_t *source)
{
    if (source == 0) {
        return;
    }
    if (source->open) {
        (void)f_close(&source->file);
        source->open = false;
    }
    if (source->mounted) {
        (void)f_mount(0, "0:", 0u);
        source->mounted = false;
    }
}

video_source_t fatfs_video_as_source(fatfs_video_source_t *source)
{
    video_source_t result;
    result.context = source;
    result.read = read_video_bytes;
    result.rewind = rewind_video;
    return result;
}
