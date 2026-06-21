`timescale 1ps/1ns
`default_nettype none

module top (
	// 50MHz clock input signal
	input wire clk,

	// We only use one
	input wire [1:0] button,

	// UART signals, GPIO 14 and 15 are UART TX and RX respectively in the icepi zero documentation
	inout wire [27:0] gpio,

	// debug LEDs
	output wire [4:0] led
	);

	wire rx;
	assign rx = gpio[15];
	wire tx;
	assign gpio[14] = tx;

	// Besides from tx (which we drive) set all gpio to high impedance
	assign gpio[13:0] = 'z;
	assign gpio[27:16] = 'z;

	// This register will store the data your RX receives and should then pass it on to the TX
	reg [7:0] dataIn;

	// Assign debug LEDs to lower 5 bits of our input data
	assign led = dataIn[4:0];

	// Assign our reset signal to a button
	logic rst_n;
	// We need to use a debouncer because buttons "bounce". See https://www.allaboutcircuits.com/technical-articles/switch-bounce-how-to-deal-with-it/
	debouncer rstDebounce (
		.clk(clk),
		.bouncy_sig(button[1]), // Buttons are pull up, so they are default high and go low when pressed. Matches active low reset
		.sig(rst_n)
	);


	// ------- ADD YOUR WIRES AND REGISTERS FOR THE DESIGN HERE ------- \\
	
	// Control state machine
	localparam STATE_PREP = 2'd0; //State 1
	localparam STATE_SEND = 2'd1; // State 2
	localparam STATE_WAIT = 2'd2; // State 3

	logic [2:0] bit_counter; //this will count from 0 to 7
	logic [1:0] state; 

	logic tx_start;
	logic tx_busy;
	
	logic rx_valid;
	logic [7:0] rx_data;

	// ------------ INSTANTIATE YOUR RX AND TX MODULES HERE ------------ \\

	//module instantiations, create a copy of these modules in top module's logic.
	//connect local variables to these params of the modules
	//basically this is where fsms layer onto each other, 
	//think of this like the stack diagrams from encm 335
		//except theres tons of background tasks and multitasking
		//sort of like recursion?
		//or like 370 with throughput and forwarding and stalling  
	uart_tx txModule (
		.clk(clk),
		.rst_n(rst_n),
		.data_in(dataIn),
		.start(tx_start),
		.tx(tx),
		.busy(tx_busy)
	);

	uart_rx rxModule (
		.clk(clk),
		.rst_n(rst_n),
		.rx(rx),
		.data_out(rx_data),
		.valid(rx_valid)
	);

	
	// ------------ Top Module's Behaviour ------------ \\
	always_ff @(posedge clk) begin
		if (~rst_n) begin
			state <= STATE_PREP;
			bit_counter <= 3'd0; //start at LSB
			dataIn <= 8'd0; //if metastable, just start dataIn with 8 zeroes. 
			tx_start <= 1'b0; //and just start going into TX state to transmit

		end else begin
			tx_start <= 1'b0; // default: don't start TX unless state says so

			case (state)
				STATE_PREP: begin
					dataIn[bit_counter] <= 1'b0; // put 0 into this bit

					if (bit_counter == 3'd7) begin
						bit_counter <= 3'd0;
						state <= STATE_SEND;

					end else begin
						bit_counter <= bit_counter + 3'd1;
					end
				end

				STATE_SEND: begin
					if (!tx_busy) begin
						tx_start <= 1'b1; // tell TX module: send dataIn
						state <= STATE_WAIT;
                	end
				end

				STATE_WAIT: begin
					if (!tx_busy) begin
						state <= STATE_PREP;
                	end
				end

				default: begin
					state <= STATE_PREP;
				end
		
			endcase 

		end
	end
	
endmodule

// ------------ TX Transmitter Behaviour ------------ \\

module uart_tx (
    input  wire clk,
    input  wire rst_n,

    input  logic [7:0] data_in,
    input  logic start,

    output logic tx, //outputting signals to top module constantly
    output logic busy
	);

	localparam CLOCK_FREQ = 50_000_000;
    localparam BAUD_RATE = 9600;
    localparam CLKS_PER_BIT = CLOCK_FREQ / BAUD_RATE; // so in this case 5208 clk periods

    localparam TX_IDLE  = 2'd0;
    localparam TX_START = 2'd1;
    localparam TX_DATA  = 2'd2;
    localparam TX_STOP  = 2'd3;

	logic [1:0] state;
    logic [12:0] cycle_counter;
    logic [2:0] bit_counter;
	logic [7:0] saved_data;

	always_ff @(posedge clk) begin
		if (~rst_n) begin
			state <= TX_IDLE;
			//configure metastable values if needed?
			tx <= 1'b1;
        	busy <= 1'b0;
     		cycle_counter <= 13'd0;
        	bit_counter <= 3'd0;
        	saved_data <= 8'd0;

		end else begin
			case (state)
				
				TX_IDLE: begin
				//output that tx line is available and low (only goes active when the line gets high)
					tx <= 1'b1;
					busy <= 1'b0;
					cycle_counter <= 13'd0;
					bit_counter <= 3'd0;
					if (start) begin 
						saved_data <= data_in;
						//why not put tx here? read later
						busy <= 1'b1; 
						state <= TX_START; 
					end
				end

				TX_START: begin 
					tx <= 1'b0; //this is like, shooting a gun/ blwoing a whistle to start a race. 
					//putting to 0 after constant 1 tells fsm, hey, something is changing, note it down!
					//start tracking one cycle of 5208 clk periods

					if (cycle_counter == CLKS_PER_BIT - 1) begin
							cycle_counter <= 13'd0; //according to baud rate, hold this tx = 0 value down as a gunshot
							// and then change to actually transmitting the message for sure
							state <= TX_DATA;
					end else begin //or keep counting
						cycle_counter <= cycle_counter + 13'd1;
					end
				end

				TX_DATA: begin //lets start telephoning dis message
					tx <= saved_data[bit_counter]; 

					if (cycle_counter == CLKS_PER_BIT - 1) begin
						cycle_counter <= 13'd0; //according to baud rate, hold this bit value down
						if (bit_counter == 3'd7) begin
							bit_counter <= 3'd0;
							state <= TX_STOP; 
					end else begin
						bit_counter <= bit_counter + 3'd1; //move onto next bit of dataIn
						end
					end else begin //or keep counting
						cycle_counter <= cycle_counter + 13'd1;
					end
				end

				TX_STOP: begin
					tx <= 1'b1; //this is to show the message ended
					if (cycle_counter == CLKS_PER_BIT - 1) begin
							cycle_counter <= 13'd0; //according to baud rate
							state <= TX_IDLE;
					end else begin //or keep counting
						cycle_counter <= cycle_counter + 13'd1;
					end
				end

				default: begin
					state <= TX_IDLE;
				end

			endcase
		end
	end
	
endmodule

//biggest mindf*** is def that uart_tx does not automatically feed uart_rx explicitly in code, it has to be physically wired like on the ice pi board. 

// ------------ RX Receiver Behaviour ------------ \\	

module uart_rx (
	input  wire clk,
	input  wire rst_n,

	input  logic rx, //rx is not the full 8 bit messgae, its one bit at a time!

	output logic [7:0] data_out, //outputting signals to top module constantly
	output logic valid
	);

	localparam CLOCK_FREQ = 50_000_000;
	localparam BAUD_RATE = 9600;
	localparam CLKS_PER_BIT = CLOCK_FREQ / BAUD_RATE; // so in this case 5208 clk periods
	localparam HALF_CLKS_PER_BIT = CLKS_PER_BIT /2; 

	localparam RX_IDLE  = 3'd0;
	localparam RX_START = 3'd1;
	localparam RX_DATA  = 3'd2;
	localparam RX_STOP  = 3'd3;
	localparam RX_FINISH = 3'd4; 

	logic [2:0] state;
	logic [12:0] cycle_counter;
	logic [2:0] bit_counter;
	logic [7:0] saved_data;

	always_ff @(posedge clk) begin
		if (~rst_n) begin
			state <= RX_IDLE;
			//configure metastable values if needed?
			valid <= 1'b0;
			cycle_counter <= 13'd0;
			bit_counter <= 3'd0;
			data_out <= 8'd0;

		end else begin
			case (state)

				RX_IDLE: begin
				//output that rx line is available and low (only goes active when the line gets high)
					valid <= 1'd0; 
					cycle_counter <= 13'd0;
					bit_counter <= 3'd0;
					if (rx == 1'b0) begin 
						state <= RX_START; 
					end
				end

				RX_START : begin 
					if (cycle_counter == (HALF_CLKS_PER_BIT - 1)) begin
						cycle_counter <= 13'd0; //according to baud rate, hold this rx = 1 value down as a gunshot
						// and then change to actually transmitting the message for sure
						if (rx == 1'b0) begin
							state <= RX_DATA;
						end else begin
							state <= RX_IDLE;
						end
					end else begin //or keep counting
						cycle_counter <= cycle_counter + 13'd1;
					end
				end

				RX_DATA: begin 
				//lets start recording dis message 
					if (cycle_counter == CLKS_PER_BIT - 1) begin
						cycle_counter <= 13'd0; //according to baud rate, hold this bit value down
						saved_data[bit_counter] <= rx;
						if (bit_counter == 3'd7) begin
							bit_counter <= 3'd0;
							state <= RX_STOP; 
						end else begin
							bit_counter <= bit_counter + 3'd1; //move onto next bit of data we are receiving
						end
					end else begin //or keep counting
						cycle_counter <= cycle_counter + 13'd1;
					end
				end


				RX_STOP: begin
					valid <= 1'b0; //this is to show the recording is finished
					if (cycle_counter == CLKS_PER_BIT - 1) begin
						cycle_counter <= 13'd0; //according to baud rate
						if (rx == 1'b1) begin //if there is a valid stop bit!
							state <= RX_FINISH; //go to next state
						end else begin
    						state <= RX_IDLE;
						end
					end else begin //or keep counting
						cycle_counter <= cycle_counter + 13'd1;
					end
				end

				RX_FINISH: begin
					data_out <= saved_data;
					valid <= 1'b1; 
					state <= RX_IDLE;
				end

			endcase
		end
	end

endmodule


