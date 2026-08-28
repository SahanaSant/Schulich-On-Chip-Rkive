#include "video_stream.h"

#include "video_config.h"

bool video_stream_one_frame(video_source_t *source,
                            framebuffer_t *framebuffer,
                            uint8_t sector_buffer[512])
{
    size_t destination_offset;

    if ((source == 0) || (source->read == 0) ||
        (framebuffer == 0) || (sector_buffer == 0)) {
        return false;
    }

    for (destination_offset = 0u;
         destination_offset < VIDEO_BYTES_PER_FRAME;
         destination_offset += SD_SECTOR_BYTES) {
        size_t bytes_read = 0u;

        if (!source->read(source->context, sector_buffer,
                          SD_SECTOR_BYTES, &bytes_read)) {
            return false;
        }
        if (bytes_read != SD_SECTOR_BYTES) {
            return false;
        }
        if (!framebuffer_write_rgb565le(framebuffer,
                                       destination_offset,
                                       sector_buffer,
                                       SD_SECTOR_BYTES)) {
            return false;
        }
    }

    return true;
}
