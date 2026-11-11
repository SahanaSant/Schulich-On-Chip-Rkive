// Top level: only instantiates modules and connects them.
module top (
    input  logic       clk,
    input  logic       rst,        // reset for counter_sync  (active-high)
    input  logic       rst_n,      // reset for counter_async (active-low)
    input  logic       en,
    output logic [7:0] led_sync,
    output logic [7:0] led_async
);
    counter_sync #(.W(8)) u_sync (
        .clk   (clk),
        .rst   (rst),
        .en    (en),
        .count (led_sync)
    );

    counter_async #(.W(8)) u_async (
        .clk   (clk),
        .rst_n (rst_n),
        .en    (en),
        .count (led_async)
    );
endmodule
