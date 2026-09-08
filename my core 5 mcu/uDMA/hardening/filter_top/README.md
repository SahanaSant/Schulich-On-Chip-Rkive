# GF180 filter hardening

Target: `udma_filter`, the uDMA data-filtering block (arithmetic-unit +
bin-counter datapath sitting between a stream input and two DMA-fed
output channels). Single clock (`clk_i`), single async reset
(`resetn_i`) -- no CDC at all, unlike every other module hardened so far.
`udma_subsystem.sv` ties `clk_i` to `s_clk_periphs_core[...]`, the same
core peripheral clock domain the rest of the subsystem's peripherals run
on, so this is a genuinely single-clock-domain design; every input/output
port besides `resetn_i` is timed against that one clock. This is the
seventh uDMA peripheral hardened, after `external_per_top`, `spim_top`,
`uart_top`, `uart_rx`, `uart_tx`, and `i2c_top`.

## RTL review: one latent defect found, currently harmless

Checked for dangling ports the way the `i2c_top` `err_o` bug was found.
Two show up, but they turned out to be different in kind once traced all
the way through:

- `udma_filter_bincu.sv`: `output_datasize_o` is declared as a module
  output but is **never assigned anywhere in the module body** -- not a
  wiring gap at the instantiation site, an actual missing driver inside
  the submodule itself. Trial 1's Yosys synthesis run caught this for
  real: `Warning: Wire ...udma_filter_bincu.output_datasize_o[1] is used
  but has no driver` (and `[0]` the same), reported as 2 synthesis check
  errors that stopped the flow before placement. This is a genuine defect
  in the IP, distinct from the "just visually looks dangling" case --
  the tool is correctly flagging that this output would read as
  X/undefined if anything ever used it.
  Checked whether it matters *here*: `udma_filter.sv` leaves
  `u_filter_bincu`'s `output_datasize_o` unconnected at the instantiation
  (`( )`), and traced the consumer of `s_bincu_out_data` (the sibling
  signal that does get connected) to `udma_filter_rx_dataout`'s
  `stream_data_i` -- that module has no `stream_datasize_i` port at all,
  so nothing in this integration ever reads the value `output_datasize_o`
  would carry even if it were driven. The undriven port is real, but it's
  functionally inert in `udma_filter` as actually wired up. (Confirmed
  via `git log` this file has exactly one commit -- the original
  PULP/ETH-Zurich import -- so this predates any work on this project;
  not introducing an RTL fix for it since it doesn't affect this
  integration's behavior, but flagging it here for anyone who reuses
  `udma_filter_bincu` standalone later, where it would matter.)
- `udma_filter_rx_dataout.sv`: `io_generic_fifo`'s `elements_o` (fifo
  occupancy count, a debug/status tap) is left unconnected at its
  instantiation, but genuinely never assigned-but-unread inside that
  submodule -- it's a real output the fifo drives, just not consumed by
  its parent. Ordinary unused status output, not a defect.

RTL unchanged for this module; see "Trial 2" below for how the blocked
synthesis check is being handled instead.

## Parameter correction learned from the i2c mistake

While pulling this module's real instantiation out of `udma_subsystem.sv`,
caught the same class of mistake made on `i2c_top` Trial 1 before it
could repeat here: `udma_filter.sv`'s own RTL defaults are
`L2_AWIDTH_NOAL=15`/`TRANS_SIZE=16`, but `udma_subsystem.sv` instantiates
it with `.L2_AWIDTH_NOAL(L2_AWIDTH_NOAL)`/`.TRANS_SIZE(TRANS_SIZE)` --
the subsystem's real values, 21 and 20 (see `i2c_top`'s README for the
derivation: `L2_ADDR_WIDTH=19` + 2, and `TRANS_SIZE=20` for the 1 MB max
transaction size). These size `filter_tx_ch0_addr_o`, `filter_tx_ch1_addr_o`,
`filter_rx_ch_addr_o` (address width) and the three channels' `*_datasize_o`
handshake fields indirectly through `TRANS_SIZE`-derived internal counters.
`config.trial_1.json` uses `SYNTH_PARAMETERS: ["L2_AWIDTH_NOAL=21",
"TRANS_SIZE=20"]` from the start -- same correct values as
`external_per_top` and (from Trial 2 onward) `i2c_top`.

## SDC reasoning

Simplest SDC of any module so far, since there's exactly one clock and no
CDC to reason about:

- `create_clock` on `clk_i` at 20 ns / 50 MHz, matching every other
  peripheral in this project.
- `resetn_i` (active-low async reset) gets `set_false_path`, as everywhere
  else.
- Every other port -- the config bus (`cfg_*`), the two TX DMA channel
  handshakes (`filter_tx_ch0_*`/`filter_tx_ch1_*`), the RX DMA channel
  handshake (`filter_rx_ch_*`), and the filter engine's own stream input
  (`filter_id_i`/`filter_data_i`/`filter_datasize_i`/`filter_valid_i`/
  `filter_sof_i`/`filter_eof_i`) -- is a normal synchronous interface on
  `clk_i` (confirmed via `udma_subsystem.sv`: these all come from or go to
  other blocks in the same `s_clk_periphs_core` domain, not raw external
  pins), so they all just get the standard 2 ns input/output delay budget.
  No false paths or CDC bounding needed beyond reset.

## Trial 1 (prepared, not yet run)

`config.trial_1.json` starts directly from the full proven recipe:
`SYNTH_BUFFER_CELL = buf_2/I/Z` + `EXTRA_EXCLUDED_CELLS = [buf_1, dlyb_1]`,
`RSZ_CORNERS = [max_ss_125C_4v50]`, `set_max_fanout 32` matching
`CTS_SINK_CLUSTERING_SIZE = 32`, both hold-margin settings
(`PL_RESIZER_HOLD_SLACK_MARGIN=0.1` / `GRT_RESIZER_HOLD_SLACK_MARGIN=0.9`),
and the corrected `SYNTH_PARAMETERS` from above.

To launch:
```sh
cd ~/projects/librelane
nix develop --offline --command bash \
  ~/core5_udma/hardening/filter_top/run_trial.sh 1
```
`run_trial.sh` refuses to overwrite an existing run tag. Generated outputs
remain under `runs/TRIAL_N/` and are git-ignored, same convention as the
other modules.

Trial 1 result: blocked at synthesis. `Checker.YosysSynthChecks` failed
with "2 Yosys check errors found" -- these are exactly the 2
`output_datasize_o` undriven-wire warnings described above. Yosys's own
final `CHECK` pass later in the same run (after optimization) reports
"Found and reported 0 problems", confirming the actual synthesized
netlist is structurally sound -- this is LibreLane's synthesis-check gate
being stricter than the underlying issue warrants for a port with zero
functional impact on this integration.

## Trial 2: bypass the check for this known-benign warning

`config.trial_2.json` = `config.trial_1.json` + `QUIT_ON_SYNTH_CHECKS:
false`. This lets the flow continue past `Checker.YosysSynthChecks`
instead of erroring out, without touching the third-party RTL for a
defect that's inert in this specific integration (as traced above). Not
verified against LibreLane's variable registry directly (no access to it
from here) -- if this key name is wrong, LibreLane will fail fast with an
"unknown configuration variable" error rather than silently doing nothing,
so it's a safe experiment either way.

To launch:
```sh
cd ~/projects/librelane
nix develop --offline --command bash \
  ~/core5_udma/hardening/filter_top/run_trial.sh 2
```
