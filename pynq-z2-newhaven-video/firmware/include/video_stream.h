#ifndef VIDEO_STREAM_H
#define VIDEO_STREAM_H

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include "framebuffer.h"

typedef bool (*video_read_fn)(void *context,
                              uint8_t *destination,
                              size_t requested_bytes,
                              size_t *bytes_read);
typedef bool (*video_rewind_fn)(void *context);

typedef struct {
    void *context;
    video_read_fn read;
    video_rewind_fn rewind;
} video_source_t;

bool video_stream_one_frame(video_source_t *source,
                            framebuffer_t *framebuffer,
                            uint8_t sector_buffer[512]);

#endif
