module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    
    sr lf1(KEY[0],KEY[1],SW[0], LEDR[2], LEDR[0]);
    sr lf2(KEY[0],KEY[1],SW[1], LEDR[0], LEDR[1]);
    sr lf3(KEY[0],KEY[1],SW[2], LEDR[1]^LEDR[2], LEDR[2]);
        
endmodule
        module sr(
            input clk,
            input L,
            input rin,
            input qin,
            output reg Q);
            always @(posedge clk)begin
                Q <= L? rin:qin;
            end
        endmodule
        
        
