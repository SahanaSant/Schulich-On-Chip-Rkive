from __future__ import annotations

import io
import sys
import tempfile
import unittest
from pathlib import Path

REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(REPOSITORY_ROOT / "software"))
sys.path.insert(0, str(REPOSITORY_ROOT / "tools"))

from frame_player import (
    CONTROL_ENABLE,
    CONTROL_START,
    STATUS_BUSY,
    STATUS_DONE,
    STATUS_INITIALIZED,
    FramePlayer,
)
from make_test_video import generate_frame, write_video
from video_format import (
    FRAME_BYTES,
    encode_rgb565le,
    frame_count,
    iter_frames,
    rgb888_to_rgb565,
)


class FakeBackend:
    def __init__(self) -> None:
        self.frame = None
        self.control_writes = []
        self.status = STATUS_INITIALIZED
        self.completion_polls = 0

    def write_frame(self, frame: bytes) -> None:
        self.frame = frame

    def write_control(self, value: int) -> None:
        self.control_writes.append(value)
        self.status = STATUS_INITIALIZED | STATUS_BUSY
        self.completion_polls = 0

    def read_status(self) -> int:
        if self.status & STATUS_BUSY:
            self.completion_polls += 1
            if self.completion_polls >= 2:
                self.status = STATUS_INITIALIZED | STATUS_DONE
        return self.status


class VideoFormatTests(unittest.TestCase):
    def test_primary_rgb565_colors_and_little_endian_storage(self) -> None:
        self.assertEqual(rgb888_to_rgb565(255, 0, 0), 0xF800)
        self.assertEqual(rgb888_to_rgb565(0, 255, 0), 0x07E0)
        self.assertEqual(rgb888_to_rgb565(0, 0, 255), 0x001F)
        self.assertEqual(encode_rgb565le(0xF800), b"\x00\xF8")

    def test_rejects_truncated_video(self) -> None:
        with self.assertRaises(ValueError):
            frame_count(FRAME_BYTES + 1)
        with self.assertRaises(ValueError):
            list(iter_frames(io.BytesIO(bytes(FRAME_BYTES - 1))))

    def test_pattern_generator_writes_complete_frames(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory) / "pattern.rgb565"
            write_video(output, 2)
            self.assertEqual(output.stat().st_size, 2 * FRAME_BYTES)
            with output.open("rb") as stream:
                self.assertEqual(len(list(iter_frames(stream))), 2)


class FramePlayerTests(unittest.TestCase):
    def test_one_frame_is_copied_started_and_completed(self) -> None:
        backend = FakeBackend()
        player = FramePlayer(
            backend,
            timeout_seconds=0.1,
            poll_interval_seconds=0,
            sleep=lambda _: None,
        )
        frame = generate_frame(0, 1)
        player.wait_until_initialized()
        player.play_frame(frame)
        self.assertEqual(backend.frame, frame)
        self.assertEqual(backend.control_writes, [CONTROL_ENABLE | CONTROL_START])
        self.assertTrue(backend.status & STATUS_DONE)

    def test_wrong_frame_size_is_rejected(self) -> None:
        player = FramePlayer(FakeBackend())
        with self.assertRaises(ValueError):
            player.play_frame(bytes(FRAME_BYTES - 2))


if __name__ == "__main__":
    unittest.main()
