set script_dir [file dirname [info script]]
set repo_dir [file dirname $script_dir]
puts "RTL repository: $repo_dir"

set rtl_dir [file join $repo_dir rtl]
read_verilog -sv [list \
    "$rtl_dir/spi_byte_master.sv" \
    "$rtl_dir/axi_lite_spi_master.sv" \
    "$rtl_dir/axi_lite_framebuffer_writer.sv" \
    "$rtl_dir/framebuffer.sv" \
    "$rtl_dir/axi_lite_display_control.sv" \
    "$rtl_dir/display_controller.sv" \
    "$rtl_dir/lcd_3wire_spi.sv" \
    "$rtl_dir/video_display_subsystem.sv"]
synth_design -rtl -top video_display_subsystem -part xc7z020clg400-1
puts "PASS: Vivado elaborated the complete video display subsystem"
exit
