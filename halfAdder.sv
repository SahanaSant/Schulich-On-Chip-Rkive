module fullAdder (
    input a,
    input b,
    input carry,
    output s,
    output C_out
);

    wire xor_ab;
    wire and_1; 
    wire and_2; 

    assign xor_ab = a^b; 

    assign s = xor_ab ^ carry; 

    assign and_1 = xor_ab & carry; 

    assign and_2 = a & b; 

    assign C_out = and_2 | and_1; 

endmodule

// TO make ripple adder you can do it like this and hardcode it 
module ripple_adder 

//The for loops in SystemVerilog arent sequential and through order but through logic gates