# FatFs R0.16

This directory vendors the official FatFs R0.16 filesystem core downloaded
from <https://elm-chan.org/fsw/ff/>.

Project configuration:

- read-only filesystem;
- one volume (`0:`);
- FAT12/FAT16/FAT32 enabled, exFAT disabled;
- 512-byte sectors;
- short filenames (the video is named `VIDEO.RGB`);
- no RTC and no RTOS synchronization;
- tiny mode to minimize MicroBlaze RAM use.

`firmware/src/fatfs_diskio.c` supplies the media functions for the custom SD
SPI driver. Do not add the generic upstream `diskio.c`, because it contains
only unimplemented placeholders.

The unmodified upstream license is preserved in `LICENSE.txt`.
