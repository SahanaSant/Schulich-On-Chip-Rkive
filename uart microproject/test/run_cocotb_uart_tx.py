from pathlib import Path

try:
    from cocotb_tools.runner import get_runner
except ModuleNotFoundError:
    from cocotb.runner import get_runner


def main():
    root = Path(__file__).resolve().parent
    source = root / "Schulich-On-Chip-Rkive" / "uart-microproject.sv"

    runner = get_runner("icarus")
    runner.build(
        sources=[source],
        hdl_toplevel="uart_tx",
        always=True,
        waves=True,
        build_args=["-g2012"],
    )

    runner.test(
        hdl_toplevel="uart_tx",
        test_module="test_uart_tx",
        waves=True,
    )


if __name__ == "__main__":
    main()
