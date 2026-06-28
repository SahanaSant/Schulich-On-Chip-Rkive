# UART Microproject Notes

SystemVerilog UART transmitter/receiver notes, FSM thoughts, and cocotb testbench reminders.

## Initial Notes

- Have an FSM.
- Enter into idle state; create 8 bit data for rx readily, using the button.
- Enter into state where u create pattern for button, click it 8 times (dont use clk?).

## Top-Level FSM Thoughts

- Second state is not sending stuff at clk edge.
  - Prepares to go to next MSB or byte of data.
- Third is sending from to TX to RX.
- Update on the clock edge.

## Extra Signals

- The stop bit is the eigth bit.
- After that go into idle state.
- BAUDRATE is 9600.
- Extra signals like `tx_busy`, `rx_data`, `rx_valid` make the fsm operate like an RTOS, multitasking.
- FSM acts like something to order and prioritize tasks.
- While creating the stream of data, you are also sending it to the tx, while also making sure u reset the 8 byte stream.

## TX And RX Modules

U need to write extra tx and rx module, not just top module to coordinate.

### TX FSM

tx would need around 4 states in its fsm:

- Start state that the line is available.
- s2 where u start, to enter u need signal from top module, tx_ready.
- s3 collects data, tx_busy.
- s4 sends the stop bit.

### RX FSM

rx would need around 5 states in the fsm:

- Starts when the line is low.
- See what the tx is spitting output.
- Note down.
- Check that tx is done.
- Then end.

## Baudrate Notes

- Make sure the fsm in top module enters into state based on baudrate not clk!
- Baudrate ensures how many bits per second are sent.
- 96 000 bits per second, clk is 50 MHz.
  - How long should one uart bit last? clk periods to send one bit is 5208.
  - Track the clk cycles during the process to switch between sending out bits and preparing bits to send.

## One More

Keep top module high level:

- make/load `dataIn`
- pulse `tx_start`
- wait for `tx_busy`
- maybe read `rx_valid`

## RX Module Params

What are the params in rx module for?

```systemverilog
.clk(clk),
.rst_n(rst_n),
.rx(rx),
.data_out(rx_data),
.valid(rx_valid)
```

### `.rx(rx)`

- signal value, possibly a signal to top module?
- nah i think its the data from tx.

### `.data_out(rx_data)`

- rx will spit out 8 bit messgae, output.

### `.valid(rx_valid)`

- this is the stop bit? output.

## Local Variables

What local variables do I use?

```systemverilog
RX_IDLE
RX_START
RX_DATA
RX_STOP

logic [1:0] state;
logic [12:0] cycle_counter;
logic [2:0] bit_counter;
logic [7:0] final_message;
```

## Wiring Note

***see on line 231,***

> "biggest mindf*** is def that uart_tx does not automatically feed uart_rx explicitly in code, it has to be physically wired like on the ice pi board."

## Timing Note

Another note:

Think of hte tx and rx using their ownt imers. Because of setup and hold time constraints, rx sampels tx's communciated value at half of the baud rate heartbeat.

Waiting 5207 (almost 5208!) clock cycles to accept previous byte when tx is making a new byte is dangerous. So instead wait 2604 cycles, and then rx can sample and record what tx is saying.

## Testbench Notes

Things about test bench to take note of:

- "Await" in cocotb ide controls the timing of fsm.
  - In this case, we wait [5208 cycles or 2604 cycles] times [clk period].
- "Assert" checked whether the fsm did the correct task asked.
  - Python checks whether the 8 bit message we transmitted at the specific bit index was transmitted by Verilog correctly!

## Running The Test

To test this, we need to test in terminal with runner file:

```powershell
py <filename>.py
```

Check for the output.

<img width="1298" height="312" alt="image" src="https://github.com/user-attachments/assets/553611a6-a5c1-4842-9823-526220e75940" />

