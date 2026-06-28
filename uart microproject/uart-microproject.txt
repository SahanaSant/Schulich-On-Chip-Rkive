Notes I am gonna take:
- Have an FSM 

- enter into idle state; create 8 bit data for rx readily, using the button
- enter into state where u create pattern for button, click it 8 times (dont use clk?)

- second state is not sending stuff at clk edge
    -Prepares to go to next MSB or byte of data

- third is sending from to TX to RX
- Update on the clock edge

- Add extra signals 
    - The stop bit is the eigth bit
    - after that go into idle state 
    - BAUDRATE is 9600 
    - Extra signals like tx_busy, rx_data, rx_valid make the fsm operate like an RTOS, multitasking.
    - FSM acts like something to order and prioritize tasks. 
    - While creating the stream of data, you are also sending it to the tx, while also making sure u reset the 8 byte stream

- U need to write extra tx and rx module, not just top module to coordinate
    - tx would need around 4 states in its fsm 
        - start state that the line is available
        - s2 where u start, to enter u need signal from top module, tx_ready
        - s3 collects data, tx_busy
        - s4 sends the stop bit
    
    - rx would need around 5 states in the fsm
        - starts when the line is low 
        - see what the tx is spitting output
        - note down
        - check that tx is done 
        - then end 

    -make sure the fsm in top module enters into state based on baudrate not clk!
    -baudrate ensures how many bits per second are sent 
    - 96 000 bits per second, clk is 50 MHz
        - how long should one uart bit last? clk periods to send one bit is 5208 
        - track the clk cycles during the process to switch between sending out bits and preparing bits to send

One More,
Keep top module high level 
    make/load dataIn
    pulse tx_start
    wait for tx_busy
    maybe read rx_valid

What are the params in rx module for?
    .clk(clk),
    .rst_n(rst_n),
    .rx(rx),
        signal value, possibly a signal to top module?
        nah i think its the data from tx
    .data_out(rx_data),
        rx will spit out 8 bit messgae, output
    .valid(rx_valid)
        this is the stop bit? output

What local variables do I use?
    RX_IDLE
    RX_START
    RX_DATA
    RX_STOP

    logic [1:0] state; 
    logic [12:0] cycle_counter;
    logic [2:0] bit_counter; 
    logic [7:0] final_message; 

***see on line 231, 
    "biggest mindf*** is def that uart_tx does not automatically feed uart_rx explicitly in code, it has to be physically wired like on the ice pi board."


    Another note, 
    think of hte tx and rx using their ownt imers. Because of setup and hold time constraints, rx sampels tx's communciated value at half of the baud rate heartbeat. 
    Waiting 5207 (almost 5208!) clock cycles to accept previous byte when tx is making a new byte is dangerous. So instead wait 2604 cycles, and then rx can sample and record what tx is saying. 


Things about test bench to take note of
    "Await" in cocotb ide controls the timing of fsm
        In this case, we wait [5208 cycles or 2604 cycles] times [clk period]. 
    "Assert" checked whether the fsm did the correct task asked,
        Python checks whether the 8 bit message we transmitted at the specific bit index was transmitted by Verilog correctly!

To test this, we need to test in terminal with runner file
    py <filename>.py
Check for the output. 