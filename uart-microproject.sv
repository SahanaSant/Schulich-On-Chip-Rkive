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
	localparam STATE_PREP = 4'b0001; //State 1
	localparam STATE_SEND = 4'b0010; // State 2

	logic [2:0] bit_counter; //this will count from 0 to 7
	logic [3:0] state; 

	logic tx_start;
	logic tx_busy;
	
	logic rx_valid;
	logic [7:0] rx_data; 

	// ------------ INSTANTIATE YOUR RX AND TX MODULES HERE ------------ \\

	//module instantiations
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
