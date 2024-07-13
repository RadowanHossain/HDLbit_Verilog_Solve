module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] d;
    always @(posedge clk)begin
        d<=in;
        out<= reset? 0:(~in&d)|out;
    end
endmodule
