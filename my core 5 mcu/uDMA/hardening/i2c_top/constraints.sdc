# udma_i2c_top standalone hardening constraints.
# Two clocks: sys_clk_i (register interface + TX/RX FIFO side) and
# periph_clk_i (I2C protocol engine + scl/sda pads), both 50 MHz, crossing
# through udma_dc_fifo (token-ring based) in each direction -- same CDC
# primitive and treatment as external_per_top.

current_design udma_i2c_top

create_clock -name sys_clk -period 20.0 [get_ports sys_clk_i]
create_clock -name periph_clk -period 20.0 [get_ports periph_clk_i]

set_clock_transition 0.15 [get_clocks {sys_clk periph_clk}]
set_clock_uncertainty 0.25 [get_clocks {sys_clk periph_clk}]

if {[info exists ::env(OPENLANE_SDC_IDEAL_CLOCKS)] && $::env(OPENLANE_SDC_IDEAL_CLOCKS) == 0} {
  set_propagated_clock [get_clocks {sys_clk periph_clk}]
}

# The TX/RX udma_dc_fifo instances bridge sys_clk <-> periph_clk. As with
# external_per_top, this keeps an explicit bounded delay check on the actual
# crossing (rather than a blanket asynchronous clock-group declaration),
# so any other, unintended cross-domain path would still get caught by the
# default same-clock-group STA check instead of being silently excluded.
set_max_delay 20.0 -ignore_clock_latency -from [get_clocks sys_clk] -to [get_clocks periph_clk]
set_max_delay 20.0 -ignore_clock_latency -from [get_clocks periph_clk] -to [get_clocks sys_clk]
set_min_delay 0.0 -ignore_clock_latency -from [get_clocks sys_clk] -to [get_clocks periph_clk]
set_min_delay 0.0 -ignore_clock_latency -from [get_clocks periph_clk] -to [get_clocks sys_clk]

set sys_inputs [get_ports {
  cfg_data_i*
  cfg_addr_i*
  cfg_valid_i
  cfg_rwn_i
  cfg_rx_en_i
  cfg_rx_pending_i
  cfg_rx_curr_addr_i*
  cfg_rx_bytes_left_i*
  cfg_tx_en_i
  cfg_tx_pending_i
  cfg_tx_curr_addr_i*
  cfg_tx_bytes_left_i*
  data_tx_gnt_i
  data_tx_i*
  data_tx_valid_i
  data_rx_ready_i
}]
set sys_outputs [get_ports {
  cfg_data_o*
  cfg_ready_o
  cfg_rx_startaddr_o*
  cfg_rx_size_o*
  cfg_rx_continuous_o
  cfg_rx_en_o
  cfg_rx_clr_o
  cfg_tx_startaddr_o*
  cfg_tx_size_o*
  cfg_tx_continuous_o
  cfg_tx_en_o
  cfg_tx_clr_o
  data_tx_req_o
  data_tx_datasize_o*
  data_tx_ready_o
  data_rx_datasize_o*
  data_rx_o*
  data_rx_valid_o
}]
set periph_inputs [get_ports {ext_events_i*}]
set periph_outputs [get_ports {scl_o scl_oe sda_o sda_oe err_o}]

set_input_delay -min 2.0 -clock sys_clk $sys_inputs
set_input_delay -max 2.0 -clock sys_clk $sys_inputs
set_output_delay -min 2.0 -clock sys_clk $sys_outputs
set_output_delay -max 2.0 -clock sys_clk $sys_outputs
set_input_delay -min 2.0 -clock periph_clk $periph_inputs
set_input_delay -max 2.0 -clock periph_clk $periph_inputs
set_output_delay -min 2.0 -clock periph_clk $periph_outputs
set_output_delay -max 2.0 -clock periph_clk $periph_outputs

# scl_i/sda_i are the raw external I2C bus lines -- genuinely asynchronous,
# no defined phase relationship to periph_clk. udma_i2c_bus_ctrl's own
# 2-stage synchronizer (r_sync_scl/r_sync_sda) is what makes sampling them
# safe, not STA, so these get false paths rather than input delays (same
# reasoning as rx_i on uart_rx).
set_false_path -from [get_ports {scl_i sda_i}]

# Active-low asynchronous reset; deassertion must be coordinated at integration.
set_false_path -from [get_ports rstn_i]

set_load -pin_load 0.07291 [all_outputs]

set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin ZN $sys_inputs
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin ZN $periph_inputs
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin ZN [get_ports {scl_i sda_i rstn_i}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_4 -pin ZN [get_ports {sys_clk_i periph_clk_i}]

set_max_transition 3.0 [current_design]
set_max_capacitance 0.2 [current_design]
# 32, not 10: matches CTS_SINK_CLUSTERING_SIZE below so no CTS-built clock
# buffer can structurally exceed the limit -- see external_per_top/uart_top's
# READMEs for how the smaller value was found to clip legitimate clock-tree
# buffers.
set_max_fanout 32 [current_design]
