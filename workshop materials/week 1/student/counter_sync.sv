// 8-bit counter with a SYNCHRONOUS, active-high reset.
module counter_sync #(
    parameter int W = 8
) (
    input  logic         clk,
    input  logic         rst,     // active-high, synchronous
    input  logic         en,      // count only when en = 1
    output logic [W-1:0] count
);
    always_ff @(posedge clk) begin
        if (rst)     count <= '0;
        else if (en) count <= count + 1'b1;
    end
endmodule
