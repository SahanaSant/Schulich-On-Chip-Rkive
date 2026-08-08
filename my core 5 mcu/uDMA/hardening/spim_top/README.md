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

`spi_clk_o` is excluded from ordinary output-data timing because it is the
source-synchronous clock sent with the SPI data. Runtime divider/bypass modes
still require system-level timing review before integration.

Generated run directories and logs are ignored by the local `.gitignore`.
