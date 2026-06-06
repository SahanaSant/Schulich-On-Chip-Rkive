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

module adder ( input wire[7:0] a, input wire [7:0] b, output wire [7:0] s, output wire cout);
    genvar i; 
    wire [8:0] carry;
    assign cout = carry[8]; 

    //carry length eight bc there are  8 different carries through each half adder and the last final result c_out as the 9th bit. 

    generate //start ur for loop. this is not a sequential loop. 

        assign carry [0] = 0; 

        for (i=0; i<8; i=i+1) begin: adderLoop
            //module declaration

            fullAdder loopAdd (.a(a[i]), b(b[i]), .carry(carry[i]), .s(s[i]), .cout(carry[i+1]) )
        end
    endgenerate
endmodule