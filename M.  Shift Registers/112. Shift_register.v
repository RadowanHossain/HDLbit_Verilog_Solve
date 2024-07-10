module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    wire c1,c2,c3;
    flip d1(clk,resetn,in,c1);
    flip d2(clk,resetn,c1,c2);
    flip d3(clk,resetn,c2,c3);
    flip d4(clk,resetn,c3,out);
    
endmodule
module flip(
    input clk,
    input reset,
    input a,
    output reg q);
    always @(posedge clk)begin
        if(!reset) q <=0;
        else q <= a;
    end
endmodule
