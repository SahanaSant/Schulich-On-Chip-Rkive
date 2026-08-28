"""Generate a deterministic moving RGB565 test pattern without dependencies."""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(REPOSITORY_ROOT / "software"))

from video_format import HEIGHT, WIDTH, encode_rgb565le, rgb888_to_rgb565


def generate_frame(frame_index: int, total_frames: int) -> bytes:
    """Return one gradient frame with a moving white vertical marker."""
    if total_frames <= 0:
        raise ValueError("total_frames must be positive")

    marker_x = (frame_index * WIDTH) // total_frames
    output = bytearray()
    for y_coord in range(HEIGHT):
        for x_coord in range(WIDTH):
            if marker_x <= x_coord < min(marker_x + 8, WIDTH):
                red = green = blue = 255
            else:
                red = (x_coord * 255) // (WIDTH - 1)
                green = (y_coord * 255) // (HEIGHT - 1)
                blue = (frame_index * 255) // max(total_frames - 1, 1)
            output.extend(encode_rgb565le(rgb888_to_rgb565(red, green, blue)))
    return bytes(output)


def write_video(output_path: Path, total_frames: int) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with output_path.open("wb") as stream:
        for frame_index in range(total_frames):
            stream.write(generate_frame(frame_index, total_frames))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("output", type=Path)
    parser.add_argument("--frames", type=int, default=8)
    args = parser.parse_args()
    if args.frames <= 0:
        parser.error("--frames must be positive")

    write_video(args.output, args.frames)
    print(f"Wrote {args.frames} RGB565 frames to {args.output}")


if __name__ == "__main__":
    main()
