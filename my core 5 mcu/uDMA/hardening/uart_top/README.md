# GF180 UART top hardening

Target: `udma_uart_top`, the complete two-clock UART macro (`sys_clk_i` /
`periph_clk_i`, both 50 MHz, asynchronous to one another; RTL has its own
FIFOs/synchronizers for the crossing).

This module did not previously have a README even though extensive trial
work already exists under `runs/`. This file reconstructs that history from
the run artifacts so the state is documented before continuing.

## Reproducible environment

Same toolchain as the rest of the uDMA hardening work: LibreLane, Yosys,
Verilator, GF180 `gf180mcuD`, standard cells `gf180mcu_fd_sc_mcu7t5v0`.
`--manual-pdk --pdk-root /home/sahana/.ciel`.

## History (reconstructed from `runs/` and the `config.*` files on disk)

Early runs (`RUN_2026-07-26_*`, `TRIAL_6`-`TRIAL_11`) iterated on
`constraints.closure.sdc` (a tighter 2 ns/2 ns I/O-delay interface contract
than the original `constraints.sdc`'s 4 ns/4 ns) plus a sequence of
LibreLane config changes chasing a setup-timing failure and a large number of
max-slew violations at the `max_ss_125C_4v50` (slow, hot) corner:

- Trials 3-8 varied `DESIGN_REPAIR_MAX_SLEW_PCT`/`MAX_CAP_PCT`, CTS buffer
  selection (`CTS_ROOT_BUFFER`, `CTS_CLK_BUFFERS`, `CTS_SINK_CLUSTERING_SIZE`),
  and `MAX_FANOUT_CONSTRAINT`, without resolving the setup violation.
- Trial 9 added `SYNTH_BUFFER_CELL = buf_2/I/Z` and
  `EXTRA_EXCLUDED_CELLS = [buf_1, dlyb_1]` -- excluding the weakest buffer and
  delay-buffer cells from synthesis/resizing. This mattered: the failing path
  in earlier trials runs straight through `dlyb_1`/`buf_1` instances
  (`cfg_rwn_i` -> register-readback mux -> `cfg_data_o[*]`, a pure
  input-to-output combinational path, no register in between) and those
  cells' weak drive strength was producing multi-nanosecond slews per stage.
  Result: setup slack improved to -0.082 ns (still violating), 32 max-slew
  violations, 0 max-cap.
- Trial 10 added `GRT_RESIZER_SETUP_SLACK_MARGIN` (no change vs. Trial 9:
  same -0.082 ns / 32 slew violations).
- **Trial 11** added `RSZ_CORNERS = [max_ss_125C_4v50]` (focus the resizer's
  setup/hold repair on the actual worst corner instead of its broader
  default set). This closed it: **setup slack +0.037 ns (0 violations), 0
  max-slew, 0 max-cap.** Trial 11 is the best config on record. Its only
  remaining issue is the same clock-tree false positive documented on
  `external_per_top`: `clkbuf_0_sys_clk_i/Z` and `clkbuf_0_periph_clk_i/Z`
  both show fanout 16 against the blanket `set_max_fanout 10
  [current_design]` (2 violations, all 8 corners) -- `CTS_SINK_CLUSTERING_SIZE`
  is 32, so any limit below that can clip a legitimate CTS cluster.

After Trial 11, `config.closure_candidate.json` was written as a "final"
config for full/closure runs -- but it dropped `SYNTH_BUFFER_CELL`,
`EXTRA_EXCLUDED_CELLS`, `RSZ_CORNERS`, and `GRT_RESIZER_SETUP_SLACK_MARGIN`
relative to Trial 11, reverting to defaults for all of them. The three
`CLOSURE_FULL_*` runs use this candidate config:

- `CLOSURE_FULL_1`, `CLOSURE_FULL_2`: flow completed, but regressed all the
  way back to Trial 9/10-era numbers: **setup slack -0.393 ns (1 violation,
  max_ss_125C_4v50), 38 max-slew violations, 2 max-cap violations, 3 fanout
  violations.** The critical path is the same `cfg_rwn_i` -> `cfg_data_o[0]`
  combinational readback path, again running through `dlyb_1`/`buf_1`
  instances -- exactly the cells Trial 9-11 had excluded.
- `CLOSURE_FULL_3`: did not complete. `flow.log` stops mid-step at
  `OpenROAD.RepairDesignPostGPL` (step 32) with no error recorded in
  `error.log`; `closure_full3.stderr.log` just says `Aborted!`. Looks like an
  interrupted process (kill/OOM/host sleep), not a tool-reported failure, but
  it was never rerun to completion.

**Conclusion: the "candidate" simplification was a mistake.** It dropped the
exact settings that made Trial 11 the only clean run in this module's
history. Trial 12 (below) restarts from Trial 11's actual config rather than
the candidate.

## Trial 12 (complete -- current best hardening)

`config.trial_12.json` = `config.closure_trial_11.json` unchanged, except
`PNR_SDC_FILE`/`SIGNOFF_SDC_FILE` point at `constraints.trial_12.sdc`, which
is `constraints.closure.sdc` with `set_max_fanout` raised from 10 to 32 --
matching `CTS_SINK_CLUSTERING_SIZE` exactly, the same fix validated on
`external_per_top` (see that module's README, Trials 3-5) for this identical
clkbuf_0_{sys,periph}_clk_i root-buffer false positive.

Trial 12 completed clean: zero setup/hold/max-slew/max-cap/max-fanout
violations, zero antenna/Magic DRC/LVS/XOR issues, across all 8 PVT corners.
Worst setup slack 1.536 ns (max, ss_125C_4v50) -- a real margin, well past
Trial 11's razor-thin +0.037 ns. Worst hold slack 0.059 ns (nom_ss_125C_4v50
or similar): positive and clean per the hold checker, but thin -- worth a
second look before treating this as final, same caution as any sub-0.1 ns
hold margin. 7,018 instances, 145,647 um^2 core / 164,427 um^2 die (45.7%
utilization), 0.041 W total power.

`constraints.trial_12.sdc` / `config.trial_12.json` are the current
reference hardening for `udma_uart_top`, superseding `config.closure_
candidate.json` and the `CLOSURE_FULL_*`/`closure_trial_*` history above.

To launch:
```sh
cd ~/projects/librelane
nix develop --offline --command bash \
  ~/core5_udma/hardening/uart_top/run_trial.sh 12
```
`run_trial.sh` refuses to overwrite an existing run tag. Generated outputs
remain under `runs/TRIAL_N/` and are git-ignored, same convention as
`external_per_top`.

`CLOSURE_FULL_1/2/3` and the superseded `closure_trial_*`/`TRIAL_6..10` runs
are kept as-is (not deleted) so the record of what was tried, and why the
candidate config was a regression, stays intact. `CLOSURE_FULL_3` in
particular never finished (see above) and can be ignored/removed whenever
disk space matters more than keeping that specific evidence.

## Trial 13 (prepared, not yet run)

Follow-up on Trial 12's thin hold margin (0.059 ns at max_ff_n40C_5v50,
the fast/cold corner, as expected -- hold typically bites hardest there,
opposite of setup). Root cause: Trial 12's config (inherited from Trial
11) has no `PL_RESIZER_HOLD_SLACK_MARGIN`/`GRT_RESIZER_HOLD_SLACK_MARGIN`
at all, unlike `external_per_top`'s config -- the resizer was only ever
asked to avoid an outright hold violation, not to leave any cushion.
`config.trial_13.json` = `config.trial_12.json` plus
`PL_RESIZER_HOLD_SLACK_MARGIN = 0.1` and
`GRT_RESIZER_HOLD_SLACK_MARGIN = 0.9`, the exact values validated on
`external_per_top` (worst hold slack there ended up 0.876 ns). Same SDC
(`constraints.trial_12.sdc`, unchanged) and same `RSZ_CORNERS` focus that
fixed the setup violation -- this only asks the resizer to insert more
hold buffering, it doesn't touch setup repair scope.

Trial 13 completed clean: zero setup/hold/max-slew/max-cap/max-fanout violations, zero antenna/Magic DRC/LVS/XOR issues, across all 8 corners. Worst hold slack improved from 0.059 ns (Trial 12) to **0.129 ns** (min_ff_n40C_5v50) -- more than double, with only 15 extra hold buffers needed (7,024 instances total, up from 7,018). Worst setup slack stayed essentially the same, 1.562 ns. Power/area unchanged in any material way.

`constraints.trial_12.sdc` / `config.trial_13.json` are the current reference hardening for `udma_uart_top`.
