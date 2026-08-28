## PYNQ-Z2 125 MHz oscillator and BTN0 system reset.
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports sys_clock]
create_clock -add -name sys_clock -period 8.000 -waveform {0.000 4.000} \
    [get_ports sys_clock]

set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS33} [get_ports reset_btn]

## Optional MicroBlaze AXI UART Lite on Pmod A.
## Connect a 3.3 V USB-UART adapter with a common ground:
## adapter TX -> JA1/uart_rxd, adapter RX <- JA2/uart_txd.
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports uart_rxd]
set_property -dict {PACKAGE_PIN Y19 IOSTANDARD LVCMOS33} [get_ports uart_txd]

set_property PULLDOWN true [get_ports reset_btn]
set_property PULLUP true [get_ports uart_rxd]
