"""Convert a normal video into headerless 240x320 RGB565 frames using FFmpeg."""

from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
from pathlib import Path

REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(REPOSITORY_ROOT / "software"))

from video_format import DEFAULT_FPS, FRAME_BYTES, HEIGHT, WIDTH, frame_count


def convert_video(
    input_path: Path,
    output_path: Path,
    fps: int = DEFAULT_FPS,
    ffmpeg_command: str = "ffmpeg",
    overwrite: bool = False,
) -> int:
    if fps <= 0:
        raise ValueError("fps must be positive")
    if not input_path.is_file():
        raise FileNotFoundError(input_path)
    if output_path.exists() and not overwrite:
        raise FileExistsError(f"refusing to overwrite {output_path}")
    if shutil.which(ffmpeg_command) is None and not Path(ffmpeg_command).is_file():
        raise FileNotFoundError(
            "FFmpeg was not found. Install it or provide --ffmpeg with its path."
        )

    output_path.parent.mkdir(parents=True, exist_ok=True)
    video_filter = (
        f"fps={fps},"
        f"scale={WIDTH}:{HEIGHT}:force_original_aspect_ratio=decrease,"
        f"pad={WIDTH}:{HEIGHT}:(ow-iw)/2:(oh-ih)/2:color=black,"
        "format=rgb565le"
    )
    command = [
        ffmpeg_command,
        "-hide_banner",
        "-loglevel",
        "error",
        "-y" if overwrite else "-n",
        "-i",
        str(input_path),
        "-an",
        "-vf",
        video_filter,
        "-pix_fmt",
        "rgb565le",
        "-f",
        "rawvideo",
        str(output_path),
    ]
    subprocess.run(command, check=True)
    frames = frame_count(output_path.stat().st_size)
    if frames == 0:
        raise RuntimeError("FFmpeg produced an empty video")
    return frames


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--fps", type=int, default=DEFAULT_FPS)
    parser.add_argument("--ffmpeg", default="ffmpeg")
    parser.add_argument("--overwrite", action="store_true")
    args = parser.parse_args()

    try:
        frames = convert_video(
            args.input,
            args.output,
            fps=args.fps,
            ffmpeg_command=args.ffmpeg,
            overwrite=args.overwrite,
        )
    except (FileNotFoundError, FileExistsError, ValueError) as error:
        parser.error(str(error))
    print(
        f"Wrote {frames} frames ({frames * FRAME_BYTES} bytes) to {args.output}"
    )


if __name__ == "__main__":
    main()
