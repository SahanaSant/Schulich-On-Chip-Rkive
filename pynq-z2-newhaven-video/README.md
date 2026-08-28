# PYNQ-Z2 External-SD-to-AXI Video Loader

This folder contains a MicroBlaze bare-metal video system for reading
preconverted frames from an external SPI microSD module, writing them over AXI
to a framebuffer, and scanning them to a Newhaven ST7789VI LCD.

## Responsibility boundary

```text
External microSD --SPI--> programmable SPI controller --AXI--> MicroBlaze
                                                        |
                                                        | AXI writes
                                                        v
                                                  framebuffer
                                                        |
                                                  display controller
                                                        |
                                                        | 3-wire LCD SPI
                                                        v
                                                   Newhaven LCD
```

The external reader is a generic Catalex-style SPI microSD adapter. The design
uses a custom AXI4-Lite SPI master with a programmable clock divider,
MicroBlaze bare-metal C, official FatFs R0.16, and a FAT32 `VIDEO.RGB` file. See
`docs/team-interface.md` for the shared contract and
`docs/vivado-vitis-integration.md` for the wiring/build steps. The PC-side conversion
and test-pattern tools remain usable regardless of the final SD module.

`software/pynq_video_player.py` represents the earlier ARM/PYNQ-Linux playback
option. Keep it as a reference for now, but do not treat it as the final runtime
player if MicroBlaze reads the external card.

## Video format

- Width: 240 pixels
- Height: 320 pixels
- Frame rate: 8 frames per second
- Pixel format: RGB565
- File byte order: little-endian (`rgb565le`)
- Container: headerless consecutive frames
- Bytes per frame: 153,600

This native portrait layout matches the Newhaven initialization sequence. A
future landscape mode can rotate addressing through ST7789 `MADCTL`.

## Test without the FPGA

The tools and software scaffold use only Python's standard library.

```powershell
python .\tools\make_test_video.py build\test-pattern.rgb565 --frames 8
python -m unittest discover -s tests -v
```

Use `tools/convert_video.py` after FFmpeg is installed:

```powershell
python .\tools\convert_video.py input.mp4 build\video.rgb565
```

## Current status

- Vivado 2026.1 BASIC license verified.
- XC7Z020 device support verified.
- PYNQ-Z2 board definition recognized by Vivado.
- AXI4-Lite framebuffer bridge passes its Icarus simulation.
- Programmable mode-0 SPI engine and AXI4-Lite wrapper pass simulation.
- Newhaven/ST7789 reset, initialization, 9-bit 3-wire SPI, and framebuffer
  scanout pass RTL simulation.
- AXI4-Lite display START/STATUS registers are implemented for MicroBlaze.
- MicroBlaze SD initialization, sector reads, FatFs adapter and framebuffer
  streaming are implemented and pass host tests with a fake SDHC card.
- External reader identified as a generic six-pin Catalex-style adapter with
  an AMS1117-3.3 regulator; Arduino SPI/power wiring is documented.
- Final AXI addresses/registers are intentionally not hard-coded yet.

Run the complete test set from PowerShell:

```powershell
.\scripts\test.ps1
```
