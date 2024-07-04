module top_module (
    input clk,
    input in, 
    output out);
    wire c1;
    assign c1 = in^out;
    always @(posedge clk)
        out <= c1;
endmodule
