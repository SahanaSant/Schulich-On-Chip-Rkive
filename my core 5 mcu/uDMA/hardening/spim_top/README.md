# uDMA SPI/QSPI top hardening

This directory contains the GF180 LibreLane candidate for `udma_spim_top`.
It is deliberately marked as a candidate: functional verification and the
physical baseline are useful, but the most recent run is not signoff-clean.

## Functional verification

Verified on 2026-08-08 with FuseSoC 2.4.6 and Verilator 5.044:

- `lint_spim_top`: standalone `udma_spim_top` elaboration and lint
- `sim_spim_top`: `CFG -> SOT CS0 -> TX byte -> RX byte -> EOT`
- TX DMA data `0xA5`; RX result `0xFF` with MISO held high
- CS0 assertion, 16 SPI rising edges, MOSI zero/one activity, and EOT observed

From this `uDMA` directory, run:

```sh
fusesoc --cores-root . run \
  --target=sim_spim_top \
  --build-root /home/sahana/fusesoc-schulich-spi-sim \
  local:schulich:udma_subsystem:0.1.0
```

## GF180 candidate

- PDK: `gf180mcuD`
- Ciel revision: `54435919abffb937387ec956209f9cf5fd2dfbee`
- Current Trial 3: `sys_clk_i` and `periph_clk_i` at 50 ns (20 MHz),
  asynchronous
- Core utilization: 25%; placement density: 35%
- `gf180_latch_map.v` maps three intentional clock-gating latches to GF180
  `latq_1` cells without changing the functional SPI RTL

The original 20 ns baseline (`SPI_TRIAL_1B`) completed DRC/LVS/antenna clean,
but failed setup with worst slack `-7.814114 ns` and 924 aggregate setup
violations. The true critical paths cross rising and falling edges in the SPI
engine, leaving half of the peripheral-clock period.

The 40 ns experiment (`SPI_TRIAL_2`) improved extracted worst setup slack to
`-2.520402 ns` and eliminated all max-slew violations. It remained open with
111 aggregate setup violations, five hold violations (worst `-0.274033 ns`),
32 clock-capacitance reports, and one antenna net. Routing DRC, Magic DRC,
XOR, illegal-overlap, and LVS were clean. Do not describe Trial 2 as signoff.

Trial 3 (`SPI_TRIAL_3_RERUN`, 2026-08-08) used both the slow setup and fast
hold corners in `RSZ_CORNERS`, a 0.5 ns setup/hold repair target, CTS clusters
of 32, and eight antenna-repair iterations. The full flow completed in 5:40
with 1.29 GB peak RAM. Routing DRC, Magic DRC, XOR, illegal-overlap, and LVS
were clean; hold WNS/TNS and hold violation count were all zero. The power grid
was connected and the reported worst IR drop was 0.01%.

Trial 3 is not signoff-clean. Its slow-corner setup WNS was `-6.311066 ns`,
setup TNS was `-463.347773 ns`, and it had 357 aggregate setup violations.
The worst corner also had 492 max-slew violations; one max-capacitance
violation and one antenna net remained. KLayout DRC was unavailable because
the GF180 PDK did not provide a KLayout DRC runset, so Magic DRC is the
available geometry check. Trial 3 fixed Trial 2's hold violations, but its
setup and electrical results regressed. `config.trial_2.json` and
`constraints.trial_2.sdc` preserve the prior inputs; `config.json` and
`constraints.sdc` are the Trial 3 inputs.

Trial 4 is preserved in `config.trial_4.json`. It reuses the successful UART
Trial 11 closure strategy: 0.05 ns placement setup margin, 0.15 ns post-route
setup margin, 0.1/0.05 ns hold margins, and 40% slew/cap repair targets. It
keeps the SPI fast hold corner, excludes the weak `clkbuf_1`, and excludes all
GF180 delay cells observed in Trial 3. This directly targets the Trial 3 worst
path, where one `dlyd_1` contributed about 4.74 ns at the slow corner. Trial 4
is a hypothesis until its full post-route metrics are measured.

Trial 4 completed on 2026-08-08. It improved slow-corner setup WNS from
`-6.311066 ns` to `-3.490051 ns`, setup TNS from `-463.347773 ns` to
`-345.653699 ns`, and worst-corner max-slew violations from 492 to 227.
Hold timing, max capacitance, routing DRC, Magic DRC, XOR, illegal overlap,
and LVS were clean. It was not signoff-clean: setup violation count was 441
and two antenna nets remained.

The delay-cell exclusion was incomplete. Trial 4 removed the weak
`clkbuf_1` and the `_1` delay variants, but the resizer substituted
`dlyb_2`, `dlyb_4`, `dlyc_2`, and `dlyd_2`. These cells still appear in
the worst command-channel path. A later trial must exclude the complete GF180
delay-cell family rather than only one drive strength.

Trial 5 excluded all 12 GF180 delay-cell variants. It reduced setup to five
violations with WNS `-1.559137 ns` and TNS `-2.762253 ns`, reduced worst-corner
max-slew violations to 135, and cleared max capacitance and antenna. Routing
DRC, Magic DRC, XOR, illegal overlap, and LVS remained clean. The tradeoff was
148 hold violations with WNS `-0.326756 ns` and TNS `-8.295088 ns`, so the flow
reported deferred errors after saving its final views. Post-global-route hold
repair had reported no violations at a 0.05 ns margin; the final extracted
result shows that a larger ordinary-buffer hold cushion is required.

Trial 6 kept the Trial 5 netlist restrictions and increased only the
post-global-route hold margin from 0.05 ns to 0.40 ns. The flow completed on
2026-08-08 and eliminated all extracted hold violations. Setup also improved
to four aggregate violations with WNS `-1.115346 ns` and TNS `-1.508269 ns`.
The remaining worst path is a real rising-to-falling half-cycle path from the
command FIFO through the SPI transmit logic to `s_spi_sdo0`. Max slew improved
from 135 to 122 violations; max capacitance, antenna, routing DRC, Magic DRC,
XOR, illegal overlap, and LVS were clean. Trial 6 is the current best SPI
baseline, but it is not signoff-clean until setup and slew both reach zero.

The LibreLane synthesis-exploration flow then compared all nine supported ABC
mapping strategies using the same 50 ns constraints. The default `AREA 0`
strategy had `-10.571496 ns` pre-layout register-to-register setup slack.
`AREA 3` and `DELAY 4` both reached 0.0 ns, while `DELAY 4` used about
9,055 µm² less mapped cell area than `AREA 3`. Trial 7 therefore changes only
`SYNTH_STRATEGY` to `DELAY 4`.

Trial 7 was stopped during the first post-placement electrical repair on
2026-08-08. OpenROAD grew to about 15 GB resident memory while actively
processing the `DELAY 4` netlist, so the run was terminated before the system
became unresponsive. The incomplete run is not a timing or signoff result.
Although pre-layout setup was clean, `DELAY 4` is not a practical mapping for
this machine and flow configuration.

Trial 8 changes only `SYNTH_STRATEGY` from the Trial 6 baseline to `AREA 1`.
Synthesis exploration measured `AREA 1` at `-4.563468 ns` pre-layout setup
slack versus `-10.571496 ns` for `AREA 0`, while its mapped area was about
2,382 µm² smaller. This is the next compact timing-oriented experiment.

Trial 8 was also stopped during post-placement electrical repair on
2026-08-08. Its OpenROAD process passed 10 GB resident memory and continued to
grow, so it reached the predefined safety limit before completing. Together,
Trials 7 and 8 show that changing the ABC mapping away from the stable
`AREA 0` baseline causes impractical repair behavior on this machine.

Trial 9 returns to Trial 6's `AREA 0` mapping and changes only
`GRT_RESIZER_FIX_HOLD_FIRST` to true. Trial 6's post-route resizer repaired
setup and then inserted 1,499 hold buffers; this ordering can erode the setup
result. Trial 9 puts hold repair first so setup repair gets the final pass.

Trial 9 completed on 2026-08-08 but produced exactly the same extracted
timing and electrical metrics as Trial 6: four setup violations with WNS
`-1.115346 ns` and TNS `-1.508269 ns`, zero hold violations, 122 max-slew
violations, and zero max-capacitance violations. Antenna, routing DRC, Magic
DRC, XOR, illegal overlap, and LVS were clean. Repair ordering is therefore
not the cause of the remaining setup path.

Trial 10 returns to the Trial 6 ordering and changes only
`GRT_DESIGN_REPAIR_MAX_SLEW_PCT` from 40% to 60%. This requests a larger
post-global-route slew cushion before detailed-route extraction, where Trial 6
and Trial 9 both regressed from zero estimated slew violations to 122.

Trial 10 completed on 2026-08-08 but regressed. Post-route design repair
inserted 172 buffers and resized nine cells, versus three buffers and two
resizes in Trial 6. The extracted result had six setup violations with WNS
`-1.464887 ns` and TNS `-2.381498 ns`, 156 max-slew violations, and one
max-capacitance violation. Hold, antenna, routing DRC, Magic DRC, XOR, illegal
overlap, and LVS remained clean. The extra repair increased parasitic load and
routing delay, so 60% is not retained.

A synthesis-only screen then enabled `SYNTH_ABC_BUFFERING` on the Trial 6
baseline. Pre-layout setup improved from WNS `-10.571496 ns` with eight
violations to 0.0 ns with zero violations. Pre-layout max-slew violations fell
from 7,176 to 1,942, at the cost of mapped area increasing from 220,907.4 µm²
to 247,346.4 µm². Trial 11 changes only this buffering option and must still
prove that the improvement survives placement, routing, and extraction.

Trial 11 completed physical implementation on 2026-08-08 and eliminated all
extracted setup violations at the original 50 ns clock period. Setup WNS/TNS
and count were all zero. The tradeoff was 48 hold violations with WNS
`-0.322428 ns` and TNS `-4.688975 ns`, 123 max-slew violations, and two
max-capacitance violations. Antenna, routing DRC, Magic DRC, XOR, illegal
overlap, and LVS were clean. LibreLane saved the final views and then returned
status 2 because hold is a deferred fatal error.

Trial 12 keeps ABC buffering and changes only the post-global-route hold
margin from 0.40 ns to 0.90 ns. Trial 11 reached +0.400 ns estimated hold
slack before detailed extraction but ended at -0.322 ns, so the larger cushion
targets positive extracted hold slack without changing the 20 MHz setup target.

Trial 12 completed on 2026-08-08 with setup and hold WNS/TNS/count all zero at
the original 50 ns clock period. Antenna, routing DRC, Magic DRC, XOR, illegal
overlap, and LVS were also clean. The larger hold target inserted 4,101 hold
buffers and increased extracted worst hold slack to a non-negative result.
Trial 12 still reported 128 max-slew and two max-capacitance violations under
the original explicit 3 ns / 0.30 pF design limits.

Those electrical limits were stricter than the characterized GF180 cells used
by the failing nets. The slow-corner 7-track 5 V library specifies 7 ns maximum
transition, and `clkbuf_4` allows 0.9639 pF while the two reported loads were
0.3462 pF and 0.3400 pF. Trial 13 preserves a separate SDC that uses 7 ns and
0.90 pF, keeping the clock-cap limit below the characterized cell maximum.

Trial 13 completed on 2026-08-08 with setup and hold still fully clean.
Library-aligned constraints reduced extracted max-slew violations from 128 to
27, but three genuine per-cell max-capacitance violations remained. Antenna,
routing DRC, Magic DRC, XOR, illegal overlap, and LVS were clean. The remaining
drivers were weak `_1` variants of `aoi21`, `aoi22`, `aoi221`, `nor4`, and
`oai21`, with only small electrical overages.

Trial 14 keeps the clean Trial 13 timing and SDC, and adds only those five weak
cell variants to `EXTRA_EXCLUDED_CELLS`. GF180 provides `_2` and `_4` versions
of every family, so the experiment forces stronger characterized drivers
instead of adding a large global repair margin.

Trial 14 completed on 2026-08-08 with setup, hold, and max-slew WNS/TNS/count
all zero. Antenna, routing DRC, Magic DRC, XOR, illegal overlap, and LVS were
clean. Three very small max-capacitance violations remained: 0.002916 pF,
0.000917 pF, and 0.000710 pF beyond their cell limits. Their drivers were
`nor2_1` and `oai32_1` cells.

Trial 15 adds only `nor2_1` and `oai32_1` to the Trial 14 exclusions. Stronger
GF180 variants exist for both families, so this final targeted experiment aims
to clear the three residual capacitance flags without changing clocks, RTL, or
repair margins.

Trial 15 completed on 2026-08-08 but regressed to 14 max-slew and four
max-capacitance violations. Setup, hold, antenna, routing DRC, Magic DRC, XOR,
illegal overlap, and LVS remained clean. The extra cell exclusions changed
mapping and routing enough to create new electrical problems, so Trial 15 is
rejected and Trial 14 remains the best candidate. Trial 14 is fully clean for
setup, hold, slew, antenna, and physical checks; only its three sub-0.003 pF
max-capacitance overages remain open.

Trial 16 returns to the complete Trial 14 cell list and changes only
`GRT_DESIGN_REPAIR_MAX_CAP_PCT` from 40% to 45%. This is a post-global-route
repair cushion, not a relaxed signoff constraint: OpenROAD is asked to repair
estimated capacitance more conservatively before detailed routing adds its
final parasitic load. The experiment targets the three small extracted
overages without globally excluding `nor2_1` or `oai32_1`.

Trial 16 completed on 2026-08-08 with exit status 0, but its netlist, routed
result, and final metrics were identical to Trial 14. Setup, hold, slew,
antenna, and physical checks stayed clean, while the same three max-capacitance
violations remained. The global-route estimator did not expose these small
post-extraction overages to `repair_design`, so increasing its margin had no
effect.

The Trial 16 configuration was then revised in place instead of creating a new
trial file. It keeps the 45% margin and injects LibreLane's
`Odb.InsertECOBuffers` step immediately after detailed routing. One `buf_2` is
inserted after each known violating driver (`_12271_/ZN`, `_08355_/ZN`, and
`_09605_/ZN`), then detailed routing is rerun incrementally. This isolates each
weak driver from its original routed load while limiting the ECO to three
explicit instances. The revised run uses tag `SPI_TRIAL_16_ECO` so the initial
margin-only Trial 16 evidence is preserved.

The revised Trial 16 ECO run completed on 2026-08-08 with exit status 0. The
three ECO buffers caused six affected nets to be incrementally rerouted. Final
setup, hold, max-slew, max-capacitance, antenna, routing DRC, Magic DRC, XOR,
illegal-overlap, and LVS violation counts were all zero. Standard-cell area
increased from 459,166 to 459,218 um^2, utilization changed from 43.7212% to
43.7262%, and total power increased from 0.1130393 W to 0.1130458 W. This is
the new best SPI hardening candidate. KLayout DRC remains unavailable because
the installed GF180 PDK does not provide its required runset.

`spi_clk_o` is excluded from ordinary output-data timing because it is the
source-synchronous clock sent with the SPI data. Runtime divider/bypass modes
still require system-level timing review before integration.

Generated run directories and logs are ignored by the local `.gitignore`.
