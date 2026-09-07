# udma_uart_rx standalone hardening constraints.
# Single clock (periph_clk_i at the udma_uart_top level, generic clk_i here),
# fully synchronous internally -- no CDC in this leaf module.

current_design udma_uart_rx

create_clock -name clk -period 20.0 [get_ports clk_i]
set_clock_transition 0.15 [get_clocks clk]
set_clock_uncertainty 0.25 [get_clocks clk]

if {[info exists ::env(OPENLANE_SDC_IDEAL_CLOCKS)] && $::env(OPENLANE_SDC_IDEAL_CLOCKS) == 0} {
  set_propagated_clock [get_clocks clk]
}

set data_inputs [get_ports {
  cfg_div_i*
  cfg_en_i
  cfg_parity_en_i
  cfg_bits_i*
  cfg_stop_bits_i
  rx_ready_i
}]
set data_outputs [get_ports {
  busy_o
  err_parity_o
  err_overflow_o
  char_event_o
  rx_data_o*
  rx_valid_o
}]

set_input_delay 2.0 -clock clk $data_inputs
set_output_delay 2.0 -clock clk $data_outputs

# rx_i is the raw external UART line: genuinely asynchronous to clk_i, with no
# defined phase relationship at all. The RTL's own 3-stage synchronizer
# (reg_rx_sync) is what makes this safe, not STA -- there is no valid
# setup/hold check to run against an unrelated external bit stream, so this
# gets a false path rather than an input delay (same treatment as rstn_i
# below, and consistent with how this project treats genuinely-asynchronous
# ports elsewhere).
set_false_path -from [get_ports rx_i]

# Active-low asynchronous reset; deassertion must be coordinated at integration.
set_false_path -from [get_ports rstn_i]

set_load -pin_load 0.07291 [all_outputs]

set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin ZN $data_inputs
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin ZN [get_ports {rx_i rstn_i}]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_4 -pin ZN [get_ports clk_i]

set_max_transition 3.0 [current_design]
set_max_capacitance 0.2 [current_design]
# 32, not 10: matches CTS_SINK_CLUSTERING_SIZE below so no CTS-built clock
# buffer can structurally exceed the limit -- see external_per_top and
# uart_top's READMEs for how the smaller value was found to clip legitimate
# clock-tree buffers.
set_max_fanout 32 [current_design]
