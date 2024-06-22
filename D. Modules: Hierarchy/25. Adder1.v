module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire a1, b1;
    add16 adder1( a[15:0], b[15:0], 0, sum[15:0], a1);
    add16 adder2( a[31:16], b[31:16], a1, sum[31:16], b1);
    

endmodule
