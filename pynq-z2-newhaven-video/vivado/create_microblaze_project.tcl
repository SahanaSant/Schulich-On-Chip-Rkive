set script_dir [file dirname [info script]]
set repo_dir [file dirname $script_dir]
set board_repo [file join $repo_dir .vendor pynq-supported-board-file]
set ip_repo [file join $repo_dir build vivado_ip repository]
set project_dir [file join $repo_dir build pynq_z2_microblaze]

if {![file exists [file join $ip_repo axi_lite_spi_master component.xml]] ||
    ![file exists [file join $ip_repo video_display_subsystem component.xml]]} {
    error "Packaged IP is missing; run vivado/package_custom_ip.tcl first"
}

set_param board.repoPaths [list $board_repo]
create_project -force pynq_z2_microblaze $project_dir \
    -part xc7z020clg400-1
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
set_property target_language Verilog [current_project]
set_property simulator_language Mixed [current_project]
set_property ip_repo_paths [list $ip_repo] [current_project]
update_ip_catalog

add_files -fileset constrs_1 -norecurse [list \
    [file join $script_dir pynq_z2_system.xdc] \
    [file join $script_dir pynq_z2_sd_arduino.xdc] \
    [file join $script_dir pynq_z2_lcd_pmodb.xdc]]

create_bd_design system

set sys_clock [create_bd_port -dir I -type clk -freq_hz 125000000 sys_clock]
set reset_btn [create_bd_port -dir I -type rst reset_btn]
set_property CONFIG.POLARITY ACTIVE_HIGH $reset_btn

set clk_wiz [create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:* clk_wiz_0]
set_property -dict [list \
    CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
    CONFIG.PRIM_IN_FREQ {125.000} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {90.000} \
    CONFIG.USE_LOCKED {true} \
    CONFIG.USE_RESET {false}] $clk_wiz
connect_bd_net $sys_clock [get_bd_pins clk_wiz_0/clk_in1]

set microblaze [create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:* microblaze_0]
apply_bd_automation -rule xilinx.com:bd_rule:microblaze -config [list \
    axi_intc {0} \
    axi_periph {Disabled} \
    cache {None} \
    clk {/clk_wiz_0/clk_out1 (90 MHz)} \
    debug_module {Debug Only} \
    ecc {None} \
    local_mem {128KB} \
    preset {None}] $microblaze
# The automation builds local instruction/data memory. Enable the uncached
# peripheral data AXI master separately for SD, framebuffer, display and UART.
set_property CONFIG.C_D_AXI 1 $microblaze

set reset_cell [lindex [get_bd_cells -quiet -hier -filter {VLNV =~ "xilinx.com:ip:proc_sys_reset:*"}] 0]
if {$reset_cell eq ""} {
    error "MicroBlaze automation did not create proc_sys_reset"
}
connect_bd_net $reset_btn [get_bd_pins $reset_cell/ext_reset_in]
# Block Automation already connects clk_wiz_0/locked to dcm_locked.

set smartconnect [create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:* axi_smc]
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {4}] $smartconnect

set sd_spi [create_bd_cell -type ip \
    -vlnv schulichonachip.ca:video:axi_lite_spi_master:1.0 sd_spi_0]
set display [create_bd_cell -type ip \
    -vlnv schulichonachip.ca:video:video_display_subsystem:1.0 display_0]
set uart [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:* axi_uartlite_0]
set_property -dict [list CONFIG.C_BAUDRATE {115200}] $uart

connect_bd_intf_net [get_bd_intf_pins microblaze_0/M_AXI_DP] \
    [get_bd_intf_pins axi_smc/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins axi_smc/M00_AXI] \
    [get_bd_intf_pins sd_spi_0/s_axi]
connect_bd_intf_net [get_bd_intf_pins axi_smc/M01_AXI] \
    [get_bd_intf_pins display_0/s_fb_axi]
connect_bd_intf_net [get_bd_intf_pins axi_smc/M02_AXI] \
    [get_bd_intf_pins display_0/s_ctrl_axi]
connect_bd_intf_net [get_bd_intf_pins axi_smc/M03_AXI] \
    [get_bd_intf_pins axi_uartlite_0/S_AXI]

set axi_clock [get_bd_pins clk_wiz_0/clk_out1]
connect_bd_net $axi_clock \
    [get_bd_pins axi_smc/aclk] \
    [get_bd_pins sd_spi_0/s_axi_aclk] \
    [get_bd_pins display_0/s_axi_aclk] \
    [get_bd_pins axi_uartlite_0/s_axi_aclk]

set peripheral_resetn [get_bd_pins $reset_cell/peripheral_aresetn]
connect_bd_net $peripheral_resetn \
    [get_bd_pins axi_smc/aresetn] \
    [get_bd_pins sd_spi_0/s_axi_aresetn] \
    [get_bd_pins display_0/s_axi_aresetn] \
    [get_bd_pins axi_uartlite_0/s_axi_aresetn]

foreach {port_name direction pin_name} {
    spi_cs_n     O sd_spi_0/spi_cs_n
    spi_sclk     O sd_spi_0/spi_sclk
    spi_mosi     O sd_spi_0/spi_mosi
    spi_miso     I sd_spi_0/spi_miso
    lcd_cs_n     O display_0/lcd_cs_n
    lcd_scl      O display_0/lcd_scl
    lcd_sda      O display_0/lcd_sda
    lcd_reset_n  O display_0/lcd_reset_n
    uart_txd     O axi_uartlite_0/tx
    uart_rxd     I axi_uartlite_0/rx
} {
    set port [create_bd_port -dir $direction $port_name]
    connect_bd_net $port [get_bd_pins $pin_name]
}

assign_bd_address

validate_bd_design
save_bd_design

set wrapper [make_wrapper -files [get_files system.bd] -top]
add_files -norecurse $wrapper
set_property top system_wrapper [current_fileset]
update_compile_order -fileset sources_1
generate_target all [get_files system.bd]

puts "PASS: Created and validated the PYNQ-Z2 MicroBlaze block design"
puts "Vivado project: [file join $project_dir pynq_z2_microblaze.xpr]"
exit
