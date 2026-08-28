module framebuffer #(
    parameter int ADDR_WIDTH = 17,
    parameter int DATA_WIDTH = 16,
    parameter int LOCAT_NUM  = 76800
) (
    // Write port: driven by the AXI-side framebuffer writer.
    input  logic                  wr_clk,
    input  logic                  wr_en,
    input  logic [ADDR_WIDTH-1:0] wr_addr,
    input  logic [DATA_WIDTH-1:0] wr_data,

    // Read port: driven by the display controller.
    input  logic                  rd_clk,
    input  logic [ADDR_WIDTH-1:0] rd_addr,
    output logic [DATA_WIDTH-1:0] rd_data
);

    timeunit 1ns;
    timeprecision 1ps;

    // Simple dual-port RAM: one synchronous write port and one synchronous
    // read port. Vivado should infer block RAM for the PYNQ-Z2.
    (* ram_style = "block" *)
    logic [DATA_WIDTH-1:0] memory [0:LOCAT_NUM-1];

    always_ff @(posedge wr_clk) begin
        if (wr_en) begin
            memory[wr_addr] <= wr_data;
        end
    end

    always_ff @(posedge rd_clk) begin
        rd_data <= memory[rd_addr];
    end

endmodule
