"""Hardware-independent frame scheduling for the PYNQ video demo."""

from __future__ import annotations

import time
from collections.abc import Callable
from typing import Protocol

from video_format import FRAME_BYTES

CONTROL_OFFSET = 0x00
STATUS_OFFSET = 0x04

CONTROL_ENABLE = 1 << 0
CONTROL_START = 1 << 1

STATUS_BUSY = 1 << 0
STATUS_DONE = 1 << 1
STATUS_INITIALIZED = 1 << 2


class DisplayBackend(Protocol):
    """Minimum operations needed from a PYNQ MMIO or test backend."""

    def write_frame(self, frame: bytes) -> None:
        ...

    def write_control(self, value: int) -> None:
        ...

    def read_status(self) -> int:
        ...


class FramePlayer:
    """Copy frames and synchronize them with a single-buffer display engine."""

    def __init__(
        self,
        backend: DisplayBackend,
        timeout_seconds: float = 2.0,
        poll_interval_seconds: float = 0.001,
        monotonic: Callable[[], float] = time.monotonic,
        sleep: Callable[[float], None] = time.sleep,
    ) -> None:
        self.backend = backend
        self.timeout_seconds = timeout_seconds
        self.poll_interval_seconds = poll_interval_seconds
        self._monotonic = monotonic
        self._sleep = sleep

    def _wait_for(self, predicate: Callable[[int], bool], description: str) -> int:
        deadline = self._monotonic() + self.timeout_seconds
        while True:
            status = self.backend.read_status()
            if predicate(status):
                return status
            if self._monotonic() >= deadline:
                raise TimeoutError(f"timed out waiting for display {description}")
            self._sleep(self.poll_interval_seconds)

    def wait_until_initialized(self) -> None:
        self._wait_for(lambda status: bool(status & STATUS_INITIALIZED), "initialization")

    def play_frame(self, frame: bytes) -> None:
        if len(frame) != FRAME_BYTES:
            raise ValueError(
                f"frame has {len(frame)} bytes; expected exactly {FRAME_BYTES}"
            )

        self._wait_for(lambda status: not status & STATUS_BUSY, "idle")
        self.backend.write_frame(frame)
        self.backend.write_control(CONTROL_ENABLE | CONTROL_START)
        self._wait_for(
            lambda status: bool(status & STATUS_DONE) and not status & STATUS_BUSY,
            "completion",
        )
