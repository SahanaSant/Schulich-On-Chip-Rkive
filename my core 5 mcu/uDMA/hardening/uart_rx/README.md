# GF180 UART RX hardening

Target: `udma_uart_rx`, the UART receive shift-register/FSM leaf module.
Single clock (`clk_i` here; wired to `periph_clk_i` at the `udma_uart_top`
level, confirmed from `udma_uart_top.sv`'s instantiation), fully synchronous
internally -- no CDC in this module. Reset is `rstn_i`, active-low,
asynchronous.

## Why this module needed the real treatment

Two runs exist under `runs/RUN_2026-07-26_*` from before this project's
current methodology existed: bare default LibreLane config, no custom SDC at
all (no `PNR_SDC_FILE`/`SIGNOFF_SDC_FILE` in `config.json`), no README. They
came back with all checkers clean, but that isn't meaningful on its own --
without a real clock-to-pin interface budget (input/output delays, driving
cells, output load, max transition/capacitance/fanout), the signoff STA
isn't checking anything close to how this macro will actually be used once
integrated. `constraints.sdc` and `config.trial_1.json` below give it the
same interface contract used elsewhere in this uDMA hardening effort
(`external_per_top`, `uart_top`), so a clean result here means the same
thing it means there.

## Functional notes that shaped the SDC

- `rx_i` is the raw external UART line -- genuinely asynchronous to `clk_i`,
  with no defined phase relationship. The RTL's own 3-stage synchronizer
  (`reg_rx_sync`) is what makes sampling it safe, not STA: there's no valid
  setup/hold check to run against an unrelated external bit stream. It gets
  `set_false_path -from [get_ports rx_i]`, the same treatment as `rstn_i`.
- All other inputs/outputs (`cfg_*`, `rx_ready_i`, `busy_o`, `err_parity_o`,
  `err_overflow_o`, `char_event_o`, `rx_data_o`, `rx_valid_o`) get a plain
  2 ns input/output delay against `clk`, matching the interface budget
  `external_per_top` and `uart_top` converged on.

## Trial 1 (complete -- clean on the first try)

Flow complete: zero setup/hold/max-slew/max-cap/max-fanout violations, zero antenna/Magic DRC/LVS/XOR issues. Worst setup slack 7.136 ns, worst hold slack 0.301 ns -- comfortable margin on both, as expected for a module this small. 1,110 instances, 19,994 um^2 core / 26,916 um^2 die (49.9% utilization), 0.0047 W. One informational-only note from the antenna checker ("1 input pin(s) without antenna gate information") -- normal for a boundary port pin, not counted against `antenna__violating__nets` (0). `constraints.sdc` / `config.trial_1.json` are the reference hardening for `udma_uart_rx`.

`config.trial_1.json` starts directly from the proven recipe learned on
`uart_top` rather than repeating that trial-and-error:
`SYNTH_BUFFER_CELL = buf_2/I/Z` and `EXTRA_EXCLUDED_CELLS = [buf_1, dlyb_1]`
(exclude the weakest buffer/delay cells that were the root cause of
`uart_top`'s setup and slew failures), `RSZ_CORNERS = [max_ss_125C_4v50]`
(focus resizer repair on the actual worst corner -- the specific change that
fixed `uart_top`), and `set_max_fanout 32` matching
`CTS_SINK_CLUSTERING_SIZE = 32` from the start (instead of the 10 that
caused false-positive clock-root fanout violations on both other modules).
This is a much smaller, purely single-clock FSM than `uart_top`, so it
should have considerably more slack to work with.

To launch:
```sh
cd ~/projects/librelane
nix develop --offline --command bash \
  ~/core5_udma/hardening/uart_rx/run_trial.sh 1
```
`run_trial.sh` refuses to overwrite an existing run tag. Generated outputs
remain under `runs/TRIAL_N/` and are git-ignored, same convention as the
other modules. The earlier `RUN_2026-07-26_*` directories are kept as
historical evidence of the pre-methodology baseline, not deleted.
