module top_module ();
    reg clk=0;
    reg rst_n;
    always #5 clk = ~clk;  // Create clock with period=10
    initial `probe_start;   // Start the timing diagram

    `probe(clk);        // Probe signal "clk"
    `probe(rst_n);
    
    initial begin
        rst_n <= 0;
        #10 rst_n <= 1;
        #2000 $finish;
            // Quit the simulation
    end

    randomizer inst1 ( .clk(clk), .rst_n(rst_n));   // Sub-modules work too.

endmodule

module randomizer (input wire clk, input wire rst_n);
    reg [15:0] multiBit; 
    `probe(multiBit);
    
    
    wire newBit = multiBit[15]^multiBit[13]^multiBit[12]^multiBit[10];
    `probe(newBit);
    
    always @(posedge clk) begin
        if (~rst_n) begin
            multiBit <= 16'h1;  //non blocking assignment, seed assignment 
        end else begin
            multiBit <= {multiBit [14:0], newBit}; 
        end
    end 

endmodule