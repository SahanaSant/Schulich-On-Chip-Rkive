# uDMA UART top hardening

The canonical `config.json` is the configuration proven by LibreLane run
`TRIAL_11`. `config.closure_trial_11.json` is retained as the frozen trial
record, and Trial 5 remains the passing fallback.

## Proven environment

- Date verified: 2026-08-04
- LibreLane: 3.0.5
- PDK: GF180 `gf180mcuD`
- Ciel/PDK revision: `54435919abffb937387ec956209f9cf5fd2dfbee`
- Configuration SHA-256: `9286DFB819B5586D60A02FADD6F845BA39AF463D3E2623DF4FA5FEC157273EB0`

## Trial 11 signoff result

| Check | Result |
| --- | ---: |
| Worst setup slack | +0.037186 ns |
| Setup violations | 0 |
| Worst hold slack | +0.073652 ns |
| Hold violations | 0 |
| Max-slew violations | 0 |
| Max-capacitance violations | 0 |
| Max-fanout reports | 2 clock-root reports |
| Routing DRC | 0 |
| Magic DRC | 0 |
| LVS | Clean |
| Antenna | Clean |
| Power-grid violations | 0 |

The two fanout reports are the CTS roots `clkbuf_0_periph_clk_i/Z` and
`clkbuf_0_sys_clk_i/Z`, each with fanout 16 against the global limit of 10.
They do not coincide with setup, hold, slew, capacitance, routing, or physical
signoff failures. KLayout DRC was skipped because this GF180 installation does
not provide a supported KLayout runset; Magic DRC completed cleanly.

## Functional regression

The following FuseSoC targets passed with FuseSoC 2.4.6 and Verilator 5.044:

- `lint`
- `sim` — reset/configuration smoke test, including `N_CAM=0`
- `sim_uart_tx` — APB configuration, L2 DMA fetch, byte `0xA5`, completion event
- `sim_uart_rx` — byte `0xA5`, L2 DMA write, byte enable, completion event

Verilator cannot build in the Windows-backed source path because it contains
spaces. Use a no-space WSL build root, for example:

```sh
/nix/var/nix/profiles/default/bin/nix develop \
  /home/sahana/projects/librelane --command \
  /home/sahana/.local/bin/fusesoc \
  --cores-root /home/sahana/core5_udma run \
  --target=sim_uart_tx \
  --build-root /home/sahana/core5_fusesoc_build \
  local:schulich:udma_subsystem:0.1.0
```

Replace `sim_uart_tx` with each target listed above.

## Reproduce the physical-design flow

From the LibreLane Nix development shell:

```sh
librelane \
  --manual-pdk \
  --pdk-root /home/sahana/.ciel \
  --jobs 2 \
  --condensed \
  --hide-progress-bar \
  --run-tag UART_TOP_REPRO \
  --design-dir /home/sahana/core5_udma/hardening/uart_top \
  /home/sahana/core5_udma/hardening/uart_top/config.json
```

Full LibreLane run directories are generated evidence, not source code, and
are ignored by Git. Archive a complete run separately when long-term signoff
evidence or final GDS/LEF/lib views are required by an integration release.
