set script_dir [file dirname [info script]]
set repo_dir [file dirname $script_dir]
set build_dir [file join $repo_dir build vivado_ip]
set ip_repo [file join $build_dir repository]
set rtl_dir [file join $repo_dir rtl]

if {[file exists $build_dir]} {
    file delete -force -- $build_dir
}
file mkdir $build_dir
file mkdir $ip_repo

proc finish_core {core display_name description} {
    set_property vendor schulichonachip.ca $core
    set_property library video $core
    set_property version 1.0 $core
    set_property display_name $display_name $core
    set_property description $description $core
    set_property vendor_display_name {Schulich on a Chip} $core
    set_property company_url {https://schulichonachip.ca} $core
    set_property supported_families {zynq Production} $core
    ipx::create_xgui_files $core
    ipx::update_checksums $core
    ipx::check_integrity -quiet $core
    ipx::save_core $core
}

proc configure_axi_clock {core associated_busifs} {
    set clock_if [ipx::get_bus_interfaces s_axi_aclk -of_objects $core]
    set associated [ipx::get_bus_parameters -quiet ASSOCIATED_BUSIF \
        -of_objects $clock_if]
    if {[llength $associated] == 0} {
        set associated [ipx::add_bus_parameter ASSOCIATED_BUSIF $clock_if]
    }
    set_property value $associated_busifs $associated

    set frequency [ipx::get_bus_parameters -quiet FREQ_HZ \
        -of_objects $clock_if]
    if {[llength $frequency] == 0} {
        set frequency [ipx::add_bus_parameter FREQ_HZ $clock_if]
    }
    set_property value 90000000 $frequency
}

create_project -force package_sd [file join $build_dir package_sd] \
    -part xc7z020clg400-1
add_files -norecurse [list \
    [file join $rtl_dir spi_byte_master.sv] \
    [file join $rtl_dir axi_lite_spi_master.sv]]
set_property top axi_lite_spi_master [current_fileset]
update_compile_order -fileset sources_1
ipx::package_project -root_dir [file join $ip_repo axi_lite_spi_master] \
    -vendor schulichonachip.ca -library video -taxonomy /UserIP \
    -import_files -set_current true
set sd_core [ipx::current_core]
set_property name axi_lite_spi_master $sd_core
configure_axi_clock $sd_core s_axi
finish_core $sd_core {AXI Lite SD SPI Master} \
    {Programmable mode-0 byte SPI controller for an external microSD adapter}
close_project

create_project -force package_display [file join $build_dir package_display] \
    -part xc7z020clg400-1
add_files -norecurse [list \
    [file join $rtl_dir axi_lite_framebuffer_writer.sv] \
    [file join $rtl_dir framebuffer.sv] \
    [file join $rtl_dir axi_lite_display_control.sv] \
    [file join $rtl_dir display_controller.sv] \
    [file join $rtl_dir lcd_3wire_spi.sv] \
    [file join $rtl_dir video_display_subsystem.sv]]
set_property top video_display_subsystem [current_fileset]
update_compile_order -fileset sources_1
ipx::package_project -root_dir [file join $ip_repo video_display_subsystem] \
    -vendor schulichonachip.ca -library video -taxonomy /UserIP \
    -import_files -set_current true
set display_core [ipx::current_core]
set_property name video_display_subsystem $display_core
configure_axi_clock $display_core s_ctrl_axi:s_fb_axi
finish_core $display_core {Newhaven AXI Video Display Subsystem} \
    {AXI RGB565 framebuffer, control registers, ST7789 initialization, and 3-wire scanout}
close_project

puts "PASS: Packaged custom AXI IP in $ip_repo"
exit
