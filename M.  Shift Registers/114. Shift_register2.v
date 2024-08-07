module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    MUXDFF(KEY[0],KEY[1],KEY[2],KEY[3],SW[3],LEDR[3]);
    MUXDFF(KEY[0],KEY[1],KEY[2],LEDR[3],SW[2],LEDR[2]);
    MUXDFF(KEY[0],KEY[1],KEY[2],LEDR[2],SW[1],LEDR[1]);
    MUXDFF(KEY[0],KEY[1],KEY[2],LEDR[1],SW[0],LEDR[0]);

endmodule

module MUXDFF(
    input clk,
    input E, 
    input L,
    input W,
    input R,
    output reg Q);
    always @(posedge clk)begin
        Q <= L? R:(E?W:Q);
    end

endmodule
