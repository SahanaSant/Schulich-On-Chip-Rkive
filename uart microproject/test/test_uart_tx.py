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


#Before getting into the test cases, we need to ensure that the DUT is reset and ready for testing. 
# The reset_dut function handles this by asserting the reset signal and waiting for a few clock cycles before deasserting it. 
# The send_byte function is used to send a byte of data to the UART transmitter by setting the data_in signal and asserting the start signal for one clock cycle.


#To explain some of the syntax,
#Await generally means that the function will pause at that point until the awaited event occurs.
#In this case, we are waiting for clock edges or timers to ensure proper timing in our testbench.
#This is a different purpose than our three modules bcs FSMs only change state over time

@cocotb.test() #Testcase to check if the UART transmitter sends the start bit, data bits, and stop bit correctly
async def uart_tx_sends_start_data_and_stop_bits(dut):
    cocotb.start_soon(Clock(dut.clk, CLK_PERIOD_NS, unit="ns").start())
    await reset_dut(dut)

    value = 0xA5 #lets choose to send this eight bit value (10100101 in binary) 
    #to the UART transmitter. This value is chosen because it has a mix of 1s and 0s, 
    # which allows us to test the transmitter's ability to handle different bit patterns.
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
