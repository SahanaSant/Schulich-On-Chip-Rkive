set script_dir [file dirname [info script]]
set repo_dir [file dirname $script_dir]
set project_dir [file join $repo_dir build pynq_z2_microblaze]
set output_dir [file join $repo_dir build output]
set project_file [file join $project_dir pynq_z2_microblaze.xpr]
set_param board.repoPaths [list [file join $repo_dir .vendor pynq-supported-board-file]]

if {![file exists $project_file]} {
    error "Vivado project is missing; run create_microblaze_project.tcl first"
}
file mkdir $output_dir
open_project $project_file

reset_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 2
wait_on_run impl_1
if {[get_property PROGRESS [get_runs impl_1]] ne "100%" ||
    [get_property STATUS [get_runs impl_1]] ne "write_bitstream Complete!"} {
    error "Implementation did not complete: [get_property STATUS [get_runs impl_1]]"
}

open_run impl_1
report_utilization -file [file join $output_dir utilization.rpt]
report_timing_summary -file [file join $output_dir timing_summary.rpt]
write_hw_platform -fixed -include_bit -force \
    -file [file join $output_dir pynq_z2_video.xsa]
file copy -force \
    [file join $project_dir pynq_z2_microblaze.runs impl_1 system_wrapper.bit] \
    [file join $output_dir pynq_z2_video.bit]

puts "PASS: Bitstream and MicroBlaze XSA generated in $output_dir"
exit
