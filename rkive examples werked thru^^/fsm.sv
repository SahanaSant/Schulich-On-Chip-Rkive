`default_nettype none

module sramInterface (
	input wire clk,
	input wire rst_n,
	
	// Pins going to the SDRAM chip
	output logic [12:0] sd_address,
	output logic [1:0] sd_bank,
	inout logic [15:0] sd_data_inout,
	output logic sd_chipSel,
	output logic sd_ras,
	output logic sd_cas,
	output logic sd_we,
	output logic [1:0] sd_dqm,
	output logic sd_cke,

	// Control logic from the processor/bus/whatever you hook this up to!
	input logic [15:0] din,
	output logic [15:0] dout,
	input logic [23:0] addr,
	input logic [1:0] dqm,
	input logic rw, // 1 for read, 0 for write
	input logic transaction, // assert for r/w transaction to start

	output logic ready, // Can perform a transaction
	output logic valid // Read data valid on dout
	);
	
	// Control params
	localparam MODE = 15'b000001000100000; // Single reads/writes, length 1, sequential addressing, CAS latency 2

	reg [3:0] cmd;
	assign sd_we = cmd[0];
	assign sd_cas = cmd[1];
	assign sd_ras = cmd[2];
	assign sd_chipSel = cmd[3];

	// Reset logic
	// Need to wait 200us before using memory (24630 cycles @ 123.15 MHz)
	reg [14:0] rstDelayCount; 

	wire sd_reset;
	assign sd_reset = |rstDelayCount;

	always_ff @(posedge clk) begin 
		if (~rst_n) begin
			rstDelayCount <= 24630 + 2 + 2 + 64; // 200us startup + 15ns precharge wait + 2cycles mode register set wait + 8 * 60ns refresh delay
		end else if (sd_reset) begin
			rstDelayCount <= rstDelayCount - 1;
		end
	end

	// commands (stolen from https://github.com/cheyao/icepi-zero/blob/main/firmware/sdram/memtest/sdram.v lol)
	localparam CMD_NOP             = 4'b0111;
	localparam CMD_ACTIVE          = 4'b0011;
	localparam CMD_READ            = 4'b0101;
	localparam CMD_WRITE           = 4'b0100;
	localparam CMD_BURST_TERMINATE = 4'b0110;
	localparam CMD_PRECHARGE       = 4'b0010;
	localparam CMD_AUTO_REFRESH    = 4'b0001;
	localparam CMD_LOAD_MODE       = 4'b0000;

	// Refresh timing registers
	// We send a refresh every ~7.8us
	// corresponds to about 962 cycles at our speed
	// 5% margin for safety gives ~914 cycles between refreshes
	reg [9:0] refreshTimer;
	wire refreshSoon;
	assign refreshSoon = (refreshTimer == 914);

	// In future should add logic to detect if we're in the same row and only precharge and bank activate if we're not

//Pasting until line 74, after that its the example. 

// Control state machine
	localparam STATE_START = 4'b0000; //State 0
	localparam STATE_1 = 4'b0001; // State 1

reg [1:0] state; // Also use state as a timer

//Data we need later in the transition
reg a;

    always_ff @(posedge clk) begin
        if (!rst_n)
            state <= IDLE_START;
        and else begin
            case (state)
                STATE_START: begin
                    if (a==0) begin 
                        state <= STATE_ONE; 
                    end
                end

                // no need to create logic to stay within the state. 

                STATE_ONE: begin
                    if (a==1) begin 
                        state <= STATE_START; 
                    end
                end

                default: state <= STATE_START;
            endcase
        end
    end

endmodule


