from pathlib import Path
import os

try:
    from cocotb_tools.runner import get_runner
except ModuleNotFoundError:
    from cocotb.runner import get_runner


def main():
    test_dir = Path(__file__).resolve().parent
    project_dir = test_dir.parent
    source = project_dir / "uart-microproject.sv"
    os.environ["PYTHONPATH"] = str(test_dir) + os.pathsep + os.environ.get("PYTHONPATH", "")

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
