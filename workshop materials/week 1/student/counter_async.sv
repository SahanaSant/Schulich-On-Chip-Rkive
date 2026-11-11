// 8-bit counter with an ASYNCHRONOUS, active-low reset.
// Fill in the three blanks (________).
module counter_async #(
    parameter int W = 8
) (
    input  logic         clk,
    input  logic         rst_n,   // active-low, asynchronous
    input  logic         en,      // count only when en = 1
    output logic [W-1:0] count
);
    // Blank 1: an async reset must react when rst_n FALLS, not only on the clock.
    always_ff @(posedge clk or ________ rst_n) begin

        // Blank 2: rst_n is active-low, so we reset when it is 0.
        if (________)  count <= '0;

        // Blank 3: count only when enabled.
        else if (________) count <= count + 1'b1;
    end
endmodule
