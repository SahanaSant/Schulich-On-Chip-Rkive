#ifndef FATFS_VIDEO_SOURCE_H
#define FATFS_VIDEO_SOURCE_H

#include <stdbool.h>

#include "ff.h"
#include "video_stream.h"

typedef struct {
    FATFS filesystem;
    FIL file;
    bool mounted;
    bool open;
} fatfs_video_source_t;

bool fatfs_video_open(fatfs_video_source_t *source, const char *path);
void fatfs_video_close(fatfs_video_source_t *source);
video_source_t fatfs_video_as_source(fatfs_video_source_t *source);

#endif
