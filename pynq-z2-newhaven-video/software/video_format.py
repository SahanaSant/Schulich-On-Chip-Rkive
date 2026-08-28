"""Shared constants and helpers for headerless RGB565 video files."""

from __future__ import annotations

from collections.abc import Iterator
from typing import BinaryIO

WIDTH = 240
HEIGHT = 320
BYTES_PER_PIXEL = 2
FRAME_BYTES = WIDTH * HEIGHT * BYTES_PER_PIXEL
DEFAULT_FPS = 8


def rgb888_to_rgb565(red: int, green: int, blue: int) -> int:
    """Convert three 8-bit color channels to one 16-bit RGB565 value."""
    if not all(0 <= channel <= 255 for channel in (red, green, blue)):
        raise ValueError("RGB channels must be between 0 and 255")
    return ((red & 0xF8) << 8) | ((green & 0xFC) << 3) | (blue >> 3)


def encode_rgb565le(pixel: int) -> bytes:
    """Encode one RGB565 numerical value in ARM-friendly little-endian order."""
    if not 0 <= pixel <= 0xFFFF:
        raise ValueError("RGB565 pixel must fit in 16 bits")
    return pixel.to_bytes(2, byteorder="little")


def frame_count(byte_count: int) -> int:
    """Return the number of complete frames or reject a truncated file."""
    frames, remainder = divmod(byte_count, FRAME_BYTES)
    if remainder:
        raise ValueError(
            f"video size {byte_count} is not a multiple of {FRAME_BYTES} bytes"
        )
    return frames


def iter_frames(stream: BinaryIO) -> Iterator[bytes]:
    """Yield complete frames and reject a truncated final frame."""
    while True:
        frame = stream.read(FRAME_BYTES)
        if not frame:
            return
        if len(frame) != FRAME_BYTES:
            raise ValueError(
                f"truncated frame: received {len(frame)} of {FRAME_BYTES} bytes"
            )
        yield frame
