current_design udma_filter

create_clock -name clk -period 20.0 [get_ports clk_i]
set_clock_transition 0.15 [get_clocks clk]
set_clock_uncertainty 0.25 [get_clocks clk]

if {[info exists ::env(OPENLANE_SDC_IDEAL_CLOCKS)] && $::env(OPENLANE_SDC_IDEAL_CLOCKS) == 0} {
  set_propagated_clock [get_clocks clk]
}

set all_inputs [get_ports {cfg_data_i* cfg_addr_i* cfg_valid_i cfg_rwn_i \
    filter_tx_ch0_gnt_i filter_tx_ch0_valid_i filter_tx_ch0_data_i* \
    filter_tx_ch1_gnt_i filter_tx_ch1_valid_i filter_tx_ch1_data_i* \
    filter_rx_ch_ready_i \
    filter_id_i* filter_data_i* filter_datasize_i* filter_valid_i filter_sof_i filter_eof_i}]

set all_outputs [get_ports {cfg_data_o* cfg_ready_o eot_event_o act_event_o \
    filter_tx_ch0_req_o filter_tx_ch0_addr_o* filter_tx_ch0_datasize_o* filter_tx_ch0_ready_o \
    filter_tx_ch1_req_o filter_tx_ch1_addr_o* filter_tx_ch1_datasize_o* filter_tx_ch1_ready_o \
    filter_rx_ch_addr_o* filter_rx_ch_datasize_o* filter_rx_ch_valid_o filter_rx_ch_data_o* \
    filter_ready_o}]

set_input_delay -min 2.0 -clock clk $all_inputs
set_input_delay -max 2.0 -clock clk $all_inputs
set_output_delay -min 2.0 -clock clk $all_outputs
set_output_delay -max 2.0 -clock clk $all_outputs

set_false_path -from [get_ports resetn_i]

set_load -pin_load 0.07291 [all_outputs]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin ZN $all_inputs
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_1 -pin ZN [get_ports resetn_i]
set_driving_cell -lib_cell gf180mcu_fd_sc_mcu7t5v0__inv_4 -pin ZN [get_ports clk_i]

set_max_transition 3.0 [current_design]
set_max_capacitance 0.2 [current_design]
set_max_fanout 32 [current_design]
