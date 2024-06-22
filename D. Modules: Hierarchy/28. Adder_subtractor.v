module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire con1,cout;
    wire [31:0] con3;
    assign con3 = b^{32{sub}};   
            
    add16 adder1 ( a[15:0], con3[15:0], sub, sum[15:0], cout);
    add16 adder2 ( a[31:16], con3[31:16], cout, sum[31:16], con1);
    

endmodule
