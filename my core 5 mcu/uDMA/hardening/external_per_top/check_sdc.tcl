# Run with sta -exit from the LibreLane environment.
set design_dir [file dirname [file normalize [info script]]]
read_liberty /home/sahana/.ciel/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/lib/gf180mcu_fd_sc_mcu7t5v0__ss_125C_4v50.lib
read_verilog $design_dir/runs/TRIAL_1/06-yosys-synthesis/udma_external_per_top.nl.v
link_design udma_external_per_top
read_sdc $design_dir/constraints.trial_2.sdc
check_setup -verbose
report_checks -path_delay max -group_path_count 2
