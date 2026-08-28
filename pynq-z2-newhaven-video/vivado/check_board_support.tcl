set script_path [string map {\\ /} [info script]]
set script_dir [file dirname $script_path]
set repository_root [file dirname $script_dir]
set board_repository [file join $repository_root .vendor pynq-supported-board-file]
set board_definition [file join $board_repository pynq-z2 A.0 board.xml]

puts "Project root: $repository_root"
puts "Board repository: $board_repository"
puts "Board definition: $board_definition"

if {![file exists $board_definition]} {
  error "PYNQ-Z2 board files are missing; run vivado/fetch_board_files.ps1"
}

set_param board.repoPaths [list $board_repository]
set matches [get_board_parts -quiet tul.com.tw:pynq-z2:part0:*]
if {[llength $matches] == 0} {
  error "Vivado did not recognize the PYNQ-Z2 board definition"
}

puts "PYNQ-Z2 board support is ready: [lindex $matches end]"
exit
