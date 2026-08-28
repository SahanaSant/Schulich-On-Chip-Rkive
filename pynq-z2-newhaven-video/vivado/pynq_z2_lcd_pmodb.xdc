## Newhaven NHD-2.4-240320AF-CTXP write-only 3-wire interface.
## These four signals use the top row of Pmod B on the PYNQ-Z2.
## A 40-pin, 0.5 mm FFC breakout/adapter is required for the raw display.

set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports lcd_cs_n]
set_property -dict {PACKAGE_PIN Y14 IOSTANDARD LVCMOS33} [get_ports lcd_scl]
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports lcd_sda]
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports lcd_reset_n]

set_property SLEW SLOW [get_ports {lcd_cs_n lcd_scl lcd_sda lcd_reset_n}]
set_property DRIVE 8 [get_ports {lcd_cs_n lcd_scl lcd_sda lcd_reset_n}]
