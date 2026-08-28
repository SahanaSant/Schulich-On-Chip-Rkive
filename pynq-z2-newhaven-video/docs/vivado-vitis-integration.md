# Vivado and Vitis integration

This is the board-level integration plan for Sahana's external-SD-to-AXI
scope. The supplied module is a generic six-pin Catalex-style adapter with an
AMS1117-3.3 regulator. Its exact clone and buffer IC are not printed.

## What the current design does

```text
                 FPGA programmable logic

external SD       axi_lite_spi_master             MicroBlaze C
module         +-------------------------+       +------------------+
  MISO ------->| SPI byte engine         |       | SD commands      |
  MOSI <-------|                         |<--AXI->| FatFs / VIDEO.RGB|
  SCLK <-------| programmable CLK_DIV    |       | 512-byte buffer  |
  CS_n <-------| software-controlled CS  |       +--------+---------+
               +-------------------------+                |
                                                          | AXI stores
                                                          v
                                           +---------------------------+
                                           | AXI framebuffer writer    |
                                           | 32-bit store -> 2 pixels  |
                                           +-------------+-------------+
                                                         |
                                                         | raw write port
                                                         v
                                               dual-port framebuffer
                                                         |
                                                         | RGB565 read port
                                                         v
                                                 display controller
                                                         |
                                                         | separate LCD SPI
                                                         v
                                                   Newhaven LCD
```

This is not a direct hardware SD-to-framebuffer DMA path. MicroBlaze controls
the SPI peripheral over AXI, runs the SD/FAT32 code, and performs AXI writes to
the framebuffer. That is simpler to debug. If measured throughput is too low,
the later optimization is a sector FIFO or DMA—not a rewrite of the SD
protocol or video format.

## Vivado block design

1. Create a PYNQ-Z2 RTL project and a block design.
2. Add MicroBlaze using Block Automation. Start with at least 128 KiB local
   instruction/data memory, UART Lite, an AXI timer, and no data cache for the
   first integration.
3. Add `rtl/spi_byte_master.sv` and `rtl/axi_lite_spi_master.sv` as one module
   reference or packaged custom IP. Name the instance
   `axi_lite_spi_master_0`.
4. Add `rtl/video_display_subsystem.sv` and its dependent display RTL as a
   module reference or packaged custom IP. It contains the AXI framebuffer
   writer, dual-port BRAM, display-control registers, Newhaven initialization,
   and 9-bit LCD SPI transmitter.
5. Connect the SD slave plus both `s_fb_axi_*` and `s_ctrl_axi_*` interfaces to
   the MicroBlaze data AXI network using AXI SmartConnect. All three are
   AXI4-Lite slaves; MicroBlaze is the AXI master.
6. Connect `s_axi_aclk` to the same 90 MHz AXI clock and
   `s_axi_aresetn` to the active-low peripheral reset.
7. Make `lcd_cs_n`, `lcd_scl`, `lcd_sda`, and `lcd_reset_n` external and add
   `vivado/pynq_z2_lcd_pmodb.xdc` to the project.
8. Make `spi_cs_n`, `spi_sclk`, `spi_mosi`, and `spi_miso` external and add
   `vivado/pynq_z2_sd_arduino.xdc` to the project.
9. In Address Editor, assign the SD SPI and display-control slaves 4 KiB each,
   and the framebuffer writer a 256 KiB region.
10. Validate the design, create the HDL wrapper, synthesize, implement, and
    generate the bitstream/XSA.

The inferred framebuffer consumes 76,800 × 16 bits (1,228,800 bits), so it
belongs in block RAM, not MicroBlaze local memory. The CPU only needs a single
512-byte sector buffer.

## Vitis application

1. Create a bare-metal MicroBlaze platform/application from the exported XSA.
2. Add all files from `firmware/src` and add `firmware/include` to the compiler
   include path.
3. Download official FatFs into `firmware/third_party/fatfs` as described by
   its README, then add that directory to the include path and build `ff.c`.
4. Check generated `xparameters.h`. If any `*_BASEADDR` macro name differs
   from `firmware/include/hardware_map.h`, edit that one mapping file.
5. Keep data caching disabled for the initial build, or exclude both AXI
   peripheral address ranges from the cache. Otherwise framebuffer stores can
   be held in cache instead of reaching the RTL.
6. Format the external card as FAT32 and copy the converted file to its root as
   `VIDEO.RGB`.
7. Connect UART first. The program prints progress and errors, and writes color
   bars before touching the SD card. Seeing bars isolates the AXI/framebuffer
   path from SD problems.

## Bring-up order on the board

1. Run an RTL-only bitstream that fills the framebuffer with color bars.
2. Run `microblaze_main.c` with no SD attached; confirm the color bars and the
   expected UART SD error.
3. With the FPGA signal wires disconnected, power module `VCC` from Arduino J7
   `5V5` and module `GND` from board ground. Verify approximately 3.3 V at the
   AMS1117 output with a multimeter, then remove power.
4. Connect the four Arduino SPI signal wires according to
   `vivado/pynq_z2_sd_arduino.xdc`. Never connect 5V5 to an FPGA signal pin.
   Scope `CS`, `SCLK`, `MOSI`, and `MISO`; initialization starts at 250 kHz.
5. Confirm `VIDEO.RGB` opens and the first frame appears.
6. Measure frame-load time before targeting 8 fps. The current byte-at-a-time
   AXI SPI path is correct but may need its post-initialization clock raised to
   20–25 MHz or replaced with a FIFO/burst engine for smooth playback.

The Newhaven LCD uses a separate, write-only 9-bit SPI transmitter and does not
share the SD chip-select state machine. The raw 40-pin display requires a 0.5 mm
FFC breakout/adapter. Strap display pins `IM0=1` and `IM2=1` for 3-wire SPI;
power `VDD` and `VDDI` at 3.3 V. Drive the LED backlight through a suitable
current-limited supply/driver—never from an FPGA I/O pin.

## Tests without the FPGA

From PowerShell in the repository root:

```powershell
.\scripts\test.ps1
```

The script runs the AXI, SD SPI, LCD SPI, initialization, and scanout
SystemVerilog simulations; checks all firmware and official FatFs with the
installed MicroBlaze compiler; and runs a fake-SD-card protocol test in Ubuntu.
