module top_module (
    input clk,
    input reset, 
    output [3:1] ena,
    output [15:0] q);
    
    assign ena = {((q[3:0] == 4'd9) & (q[7:4] == 4'd9) & (q[11:8] == 4'd9)), 
                  ((q[3:0] == 4'd9) & (q[7:4] == 4'd9)), 
                  (q[3:0] == 4'd9)};    
    
    bcd_count counter0 (clk, reset, 1'b1, q[3:0]);
    bcd_count counter1 (clk, reset, ena[1], q[7:4]);
    bcd_count counter2 (clk, reset, ena[2], q[11:8]);
    bcd_count counter3 (clk, reset, ena[3], q[15:12]);
    
endmodule

module bcd_count(
    input clk,
    input reset,
    input enable, 
    output reg [3:0] Q);    
    always @(posedge clk) begin
        if (reset) begin
            Q <= 0;
        end else if (enable) begin
            if (Q == 4'b1001) begin
                Q <= 0;
            end else begin
                Q <= Q + 1;
            end
        end
    end
endmodule
