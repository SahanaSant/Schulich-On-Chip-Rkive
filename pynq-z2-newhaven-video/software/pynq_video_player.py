"""Play a raw RGB565 video file through a PYNQ memory-mapped framebuffer.

This module is a scaffold until the team supplies final Vivado IP names and the
control-register contract. It is intended to run on the PYNQ-Z2, not Windows.
"""

from __future__ import annotations

import argparse
from pathlib import Path

from frame_player import FramePlayer
from video_format import FRAME_BYTES, iter_frames


class PynqMmioBackend:
    def __init__(self, overlay, control_ip_name: str, framebuffer_ip_name: str):
        from pynq import MMIO

        control = overlay.ip_dict[control_ip_name]
        framebuffer = overlay.ip_dict[framebuffer_ip_name]
        if framebuffer["addr_range"] < FRAME_BYTES:
            raise ValueError("Vivado framebuffer address range is smaller than one frame")

        self._control = MMIO(control["phys_addr"], control["addr_range"])
        self._framebuffer = MMIO(framebuffer["phys_addr"], framebuffer["addr_range"])

    def write_frame(self, frame: bytes) -> None:
        self._framebuffer.write(0, frame)

    def write_control(self, value: int) -> None:
        self._control.write(0x00, value)

    def read_status(self) -> int:
        return self._control.read(0x04)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("bitstream", type=Path, help="Vivado-generated .bit file")
    parser.add_argument("video", type=Path, help="headerless rgb565le video file")
    parser.add_argument("--control-ip", default="display_control_0")
    parser.add_argument("--framebuffer-ip", default="axi_bram_ctrl_0")
    parser.add_argument("--loop", action="store_true")
    return parser.parse_args()


def main() -> None:
    from pynq import Overlay

    args = parse_args()
    overlay = Overlay(str(args.bitstream))
    backend = PynqMmioBackend(overlay, args.control_ip, args.framebuffer_ip)
    player = FramePlayer(backend)
    player.wait_until_initialized()

    while True:
        with args.video.open("rb") as stream:
            for frame in iter_frames(stream):
                player.play_frame(frame)
        if not args.loop:
            break


if __name__ == "__main__":
    main()
