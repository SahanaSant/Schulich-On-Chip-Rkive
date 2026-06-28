import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge, RisingEdge, Timer


CLOCK_FREQ_HZ = 50_000_000
BAUD_RATE = 9600
CLKS_PER_BIT = CLOCK_FREQ_HZ // BAUD_RATE
CLK_PERIOD_NS = 20


async def reset_dut(dut):
    dut.rst_n.value = 0
    dut.data_in.value = 0
    dut.start.value = 0

    for _ in range(5):
        await RisingEdge(dut.clk)

    dut.rst_n.value = 1

    for _ in range(2):
        await RisingEdge(dut.clk)


async def send_byte(dut, value):
    dut.data_in.value = value
    dut.start.value = 1
    await RisingEdge(dut.clk)
    dut.start.value = 0


@cocotb.test()
async def uart_tx_sends_start_data_and_stop_bits(dut):
    cocotb.start_soon(Clock(dut.clk, CLK_PERIOD_NS, unit="ns").start())
    await reset_dut(dut)

    value = 0xA5
    await send_byte(dut, value)

    await FallingEdge(dut.tx)

    await Timer((CLKS_PER_BIT * CLK_PERIOD_NS) // 2, unit="ns")
    assert dut.tx.value == 0, "start bit should be low"

    for bit_index in range(8):
        await Timer(CLKS_PER_BIT * CLK_PERIOD_NS, unit="ns")
        expected = (value >> bit_index) & 1
        assert int(dut.tx.value) == expected, (
            f"data bit {bit_index} should be {expected}, got {dut.tx.value}"
        )

    await Timer(CLKS_PER_BIT * CLK_PERIOD_NS, unit="ns")
    assert dut.tx.value == 1, "stop bit should be high"

    await RisingEdge(dut.clk)
    assert dut.busy.value == 1, "transmitter should still be busy during stop bit"

    await Timer(CLKS_PER_BIT * CLK_PERIOD_NS, unit="ns")
    assert dut.tx.value == 1, "TX line should idle high after packet"
