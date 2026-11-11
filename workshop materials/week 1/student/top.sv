// Top level: only instantiates modules and connects them.
// Fill in the blanks (________).
module top (
    input  logic       clk,
    input  logic       rst,        // reset for counter_sync  (active-high)
    input  logic       rst_n,      // reset for counter_async (active-low)
    input  logic       en,
    output logic [7:0] led_sync,
    output logic [7:0] led_async
);
    // Pattern:  module_name #(.PARAM(value)) instance_name ( .port(signal), ... );
    ________ #(.W(8)) u_sync (
        .clk   (________),
        .rst   (________),
        .en    (________),
        .count (________)
    );

    ________ #(.W(8)) u_async (
        .clk   (________),
        .rst_n (________),
        .en    (________),
        .count (________)
    );
endmodule
