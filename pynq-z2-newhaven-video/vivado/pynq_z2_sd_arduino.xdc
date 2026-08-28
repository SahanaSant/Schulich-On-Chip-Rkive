## PYNQ-Z2 Arduino direct-SPI header connections for the external SD module.
## These four FPGA pins use 3.3 V LVCMOS logic.
##
## Module CS   -> Arduino SPI SS   (AR_SS)
## Module SCK  -> Arduino SPI SCK  (AR_SCK)
## Module MOSI -> Arduino SPI MOSI (AR_MOSI)
## Module MISO -> Arduino SPI MISO (AR_MISO)
##
## Power is not represented in an XDC file:
## Module VCC -> Arduino power header J7 pin 4 (5V5)
## Module GND -> Arduino SPI header pin 6 or J7 pin 2/3 (GND)

set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33 DRIVE 8 SLEW SLOW} [get_ports spi_cs_n]
set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33 DRIVE 8 SLEW SLOW} [get_ports spi_sclk]
set_property -dict {PACKAGE_PIN T12 IOSTANDARD LVCMOS33 DRIVE 8 SLEW SLOW} [get_ports spi_mosi]
set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVCMOS33} [get_ports spi_miso]

set_property PULLUP true [get_ports spi_miso]
