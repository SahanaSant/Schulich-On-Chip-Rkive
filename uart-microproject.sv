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
	


	// ------------ INSTANTIATE YOUR RX AND TX MODULES HERE ------------ \\
	

	always @(posedge clk) begin
		if (~rst_n) begin
			// Initialize registers that need it here
		end else begin
			// Otherwise, put the logic to write TX after reciving a byte from RX here
		end
	end
	
endmodule