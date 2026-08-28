# Video pipeline integration notes

This document keeps the software and hardware parts of the video pipeline
compatible. The provisional decisions below are the recommended starting point.
They can be revised if the physical modules or teammate interfaces require it.

## Confirmed

- Target board: PYNQ-Z2 (`xc7z020clg400-1`).
- Physical display: Newhaven `NHD-2.4-240320AF-CTXP` (240x320 native portrait).

## Provisional architecture decisions

- A separate external microSD module supplies the video data over SPI.
- MicroBlaze runs a bare-metal C program that initializes the card, reads a
  FAT32 file and writes video data to the framebuffer over AXI.
- Use a custom byte-oriented SPI master with an AXI4-Lite register interface
  and a programmable clock divider. This permits 100-400 kHz card
  initialization followed by faster data transfers without rebuilding the
  bitstream.
- Use SPI mode 0 (`CPOL=0`, `CPHA=0`), MSB first, with software-controlled
  chip select.
- Direct RGB565 pixels, provisionally stored little-endian in framebuffer
  memory.
- 240x320 pixels and 153,600 bytes per frame.
- Eight frames per second to match the expected 3-wire LCD bandwidth.
- Use one 256 KiB address window for a single 153,600-byte framebuffer during
  initial integration.
- Implement the framebuffer as dual-port BRAM: MicroBlaze/AXI writes through
  one port while the display controller reads through the other.

## Proposed data path

```text
External microSD module
          |
          | SPI: SCLK, MOSI, MISO, CS
          v
Custom programmable-divider SPI controller
          |
          | AXI
          v
MicroBlaze software ----AXI writes----> framebuffer
                                              |
                                              v
                                    display controller
                                              |
                                              | LCD SPI
                                              v
                                        Newhaven LCD
```

## External microSD module

| Item | Decision |
|---|---|
| Module manufacturer and part number | **Generic blue Catalex-style MicroSD Card Adapter; exact clone/part number not printed** |
| Visible hardware | **6-pin SPI header, AMS1117-3.3 regulator, and an unreadable 14-pin buffer IC** |
| Module supply | **Use 5V5 on VCC initially; verify the regulator output is approximately 3.3 V before connecting signal wires** |
| FPGA logic voltage | **3.3 V** |
| PYNQ-Z2 connector/header | **Arduino direct-SPI header plus Arduino J7 power** |
| `CS` FPGA pin | **Arduino AR_SS / package F16** |
| `MOSI` FPGA pin | **Arduino AR_MOSI / package T12** |
| `MISO` FPGA pin | **Arduino AR_MISO / package W15** |
| `SCLK` FPGA pin | **Arduino AR_SCK / package H15** |
| I/O standard | **LVCMOS33** |
| SPI implementation | **Custom AXI4-Lite SPI master with programmable divider** |
| SPI clock during initialization | **100-400 kHz** |
| SPI clock after initialization | **Start at 10 MHz; raise toward 20-25 MHz after validation** |
| Card format/filesystem | **FAT32** |
| Card filesystem library | **FatFs with a project-specific SPI `diskio` layer** |
| Software for card initialization/file reading | **MicroBlaze bare-metal C** |
| Video filename/location on the card | **`/VIDEO.RGB`** (8.3-safe FAT filename) |

This board is not mechanically Pmod-compatible, so use individual jumper
wires. Its header is labeled, from top to bottom in the supplied photograph:
`CS`, `SCK`, `MOSI`, `MISO`, `VCC`, `GND`. The signal order is therefore known,
but the exact clone and buffer-IC part number are not. Do not connect 5 V to an
FPGA signal pin: 5V5 goes only to the module's `VCC` pin.

## Framebuffer and display contract

- `video_display_subsystem` exposes a 256 KiB AXI4-Lite framebuffer window and
  a separate AXI4-Lite display-control window.
- The framebuffer is byte-addressed to MicroBlaze. Each aligned 32-bit store
  writes two adjacent 16-bit RGB565 pixels.
- Pixel 0 is the first pixel sent to the LCD, followed by row-major pixels.
- The first implementation is single-buffered. MicroBlaze waits for `DONE`
  before loading the next frame, so the LCD never reads a buffer being changed.
- Writing `CONTROL.START` creates a one-cycle hardware request. `STATUS`
  exposes `BUSY`, sticky `DONE`, `INIT_DONE`, and sticky `ERROR`.

## System integration decisions

1. Confirm that the video comes from an external SPI microSD module.
2. Confirm that a programmable-divider SPI controller is acceptable.
3. Confirm that MicroBlaze bare-metal C handles SD initialization and FAT32
   reads.
4. Record the final Vivado block-design and IP instance names.
5. Decide how MicroBlaze signals that a complete frame is ready.

## Provisional display control-register model

The RTL and MicroBlaze driver implement this register map.

| Offset | Name | Bits |
|---:|---|---|
| `0x00` | CONTROL | bit 0 `START`; write one to create a one-cycle start pulse |
| `0x04` | STATUS | bit 0 `BUSY`, bit 1 sticky `DONE`, bit 2 `INIT_DONE`, bit 3 `ERROR` |

## Addressing rule

The exact framebuffer base address matters to software, but it does not need to
be chosen by hand now. Let Vivado Address Editor assign a non-overlapping 256 KiB
range, then use the generated `xparameters.h` base-address macro in MicroBlaze C
instead of copying a numeric address into the source code.

## Provisional SD SPI register model

This is the starting contract for the custom SPI peripheral. `START` clears the
previous `DONE` value, transfers one byte and sets `DONE` when `RX_DATA` is
valid. Software controls `CS_ASSERT` separately so the card can remain selected
across a command, response and 512-byte block transfer.

| Offset | Name | Bits |
|---:|---|---|
| `0x00` | CONTROL | bit 0 `START` (write-one pulse), bit 1 `CS_ASSERT` |
| `0x04` | STATUS | bit 0 `BUSY`, bit 1 `DONE`, bit 2 `RX_VALID` |
| `0x08` | CLK_DIV | number of input-clock cycles per half SPI period |
| `0x0C` | TX_DATA | bits 7:0 transmitted MSB-first |
| `0x10` | RX_DATA | bits 7:0 received MSB-first |
