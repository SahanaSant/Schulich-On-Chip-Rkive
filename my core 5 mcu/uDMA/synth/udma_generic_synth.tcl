# Generic, technology-independent Yosys synthesis sanity check.
# GF180 standard-cell mapping is intentionally deferred to a later target.

yosys -import
source edalize_yosys_procs.tcl

# FuseSoC's common_cells dependency exposes the library's complete default
# fileset.  This uDMA configuration uses only the legacy synchronizer and edge
# propagation helpers listed below.  Several unrelated library files use
# SystemVerilog syntax not accepted by Yosys 0.52, so keep only the required
# common_cells reads for this synthesis target.  The copied RTL and the
# simulation/lint manifests remain unchanged.
set required_common_cells [list \
  "*/src/edge_propagator_tx.sv*" \
  "*/src/onehot_to_bin.sv*" \
  "*/src/deprecated/pulp_sync.sv*" \
  "*/src/deprecated/pulp_sync_wedge.sv*" \
  "*/src/edge_propagator.sv*" \
]
set filtered_read_files {}
foreach source_line [split [info body read_files] "\n"] {
  set keep_source 1
  if {[string match "*pulp-platform.org__common_cells*/src/*" $source_line]} {
    set keep_source 0
    foreach required_pattern $required_common_cells {
      if {[string match $required_pattern $source_line]} {
        set keep_source 1
      }
    }
  }
  if {$keep_source} {
    append filtered_read_files $source_line "\n"
  }
}
proc read_files {} $filtered_read_files

verilog_defaults -push
verilog_defaults -add -defer

set_defines
# Some copied helper cells guard simulation-only assertions and delays with
# VERILATOR.  Yosys does not synthesize those constructs, so use the existing
# guard for this generic synthesis target.
verilog_defines -DVERILATOR
set_incdirs
read_files
set_params

verilog_defaults -pop

hierarchy -check -top udma_subsystem
yosys proc
flatten
opt
fsm
opt
memory
opt
techmap
opt
abc -g AND,OR,XOR,XNOR,MUX
clean
check
stat

write_json local_schulich_udma_subsystem_0.1.0.json
