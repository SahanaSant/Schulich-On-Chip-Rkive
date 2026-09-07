# 20 MHz macro contract at the subsystem's 21/20 parameter widths.
current_design udma_external_per_top
create_clock -name sys_clk -period 50.0 [get_ports sys_clk_i]
create_clock -name periph_clk -period 50.0 [get_ports periph_clk_i]
set_clock_transition 0.15 [get_clocks {sys_clk periph_clk}]
set_clock_uncertainty 0.25 [get_clocks {sys_clk periph_clk}]
if {[info exists ::env(OPENLANE_SDC_IDEAL_CLOCKS)] && $::env(OPENLANE_SDC_IDEAL_CLOCKS) == 0} {
  set_propagated_clock [get_clocks {sys_clk periph_clk}]
}

# The token-ring FIFOs bridge independent clocks. Do not infer a phase
# relationship. Bound crossing data paths to 20 ns (less than one clock
# period) and remove meaningless inter-clock hold checks. Unlike blanket
# asynchronous clock groups, this retains a physical delay check.
set_max_delay 20.0 -ignore_clock_latency -from [get_clocks sys_clk] -to [get_clocks periph_clk]
set_max_delay 20.0 -ignore_clock_latency -from [get_clocks periph_clk] -to [get_clocks sys_clk]
set_min_delay 0.0 -ignore_clock_latency -from [get_clocks sys_clk] -to [get_clocks periph_clk]
set_min_delay 0.0 -ignore_clock_latency -from [get_clocks periph_clk] -to [get_clocks sys_clk]

set sys_inputs [get_ports {
 cfg_data_i* cfg_addr_i* cfg_valid_i cfg_rwn_i
 cfg_rx_en_i cfg_rx_pending_i cfg_rx_curr_addr_i* cfg_rx_bytes_left_i*
 cfg_tx_en_i cfg_tx_pending_i cfg_tx_curr_addr_i* cfg_tx_bytes_left_i*
 data_tx_gnt_i data_tx_i* data_tx_valid_i data_rx_ready_i
 external_per_status_i*
}]
set sys_outputs [get_ports {
 cfg_ready_o cfg_data_o*
 cfg_rx_startaddr_o* cfg_rx_size_o* cfg_rx_continuous_o cfg_rx_en_o cfg_rx_clr_o
 cfg_tx_startaddr_o* cfg_tx_size_o* cfg_tx_continuous_o cfg_tx_en_o cfg_tx_clr_o
 data_tx_req_o data_tx_datasize_o* data_tx_ready_o
 data_rx_datasize_o* data_rx_o* data_rx_valid_o external_per_setup_o*
}]
set periph_inputs [get_ports {data_tx_dc_ready_i data_rx_dc_valid_i data_rx_dc_i*}]
set periph_outputs [get_ports {data_tx_dc_valid_o data_tx_dc_o* data_rx_dc_ready_o}]
# Setup/status registers are sys_clk interfaces: the external peripheral or
# its wrapper must synchronize them or use a stable-data handshake.
set_input_delay -min 2.0 -clock sys_clk $sys_inputs
set_input_delay -max 2.0 -clock sys_clk $sys_inputs
set_output_delay -min 2.0 -clock sys_clk $sys_outputs
set_output_delay -max 2.0 -clock sys_clk $sys_outputs
set_input_delay -min 2.0 -clock periph_clk $periph_inputs
set_input_delay -max 2.0 -clock periph_clk $periph_inputs
set_output_delay -min 2.0 -clock periph_clk $periph_outputs
set_output_delay -max 2.0 -clock periph_clk $periph_outputs
# Active-low asynchronous reset; deassertion must be coordinated at integration.
set_false_path -from [get_ports rstn_i]

set_load -pin_load 0.07291 [all_outputs]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin ZN $sys_inputs
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin ZN $periph_inputs
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin ZN [get_ports rstn_i]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_4 -pin ZN [get_ports {sys_clk_i periph_clk_i}]
# Liberty is in ns/pF. Individual pin limits still apply when tighter.
set_max_transition 7.0 [current_design]
set_max_capacitance 0.9 [current_design]
set_max_fanout 20 [current_design]
