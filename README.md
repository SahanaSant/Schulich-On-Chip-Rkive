# Schulich-On-Chip Rkive

Small SystemVerilog archive for Schulich-on-Chip practice projects, notes, and testbenches.

## Running The UART cocotb Test

From PowerShell:

```powershell
cd "C:\Users\sahan\projects\SystemVerilog\Schulich-On-Chip-Rkive\uart microproject\test"
py run_cocotb_uart_tx.py
```

The test uses Icarus Verilog plus cocotb. A successful run should end with something like:

```text
TESTS=1 PASS=1 FAIL=0
```

## Tooling

Expected local tools:

- Python
- cocotb
- Icarus Verilog (`iverilog` and `vvp`)

Install cocotb with:

```powershell
py -m pip install cocotb
```

Check that Icarus is visible from the terminal:

```powershell
iverilog -V
vvp -V
```

## Notes

The `.sv` files are the actual hardware descriptions. The Python files in `test/` are simulation helpers that drive inputs, wait for simulated time, and check outputs.
