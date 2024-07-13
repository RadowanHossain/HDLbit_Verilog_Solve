module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
);
    //q[511:0]: Current state of the system
    //{q[510:0], 1'b0}: Right-shifted state, padded with 0 on the right (Right neighbor)
    //q[511:1]: Left-shifted state (Left neighbor)
    always @(posedge clk)begin
        if(load)
            q <=data;
        else begin
            q <=  (((q[511:0]^{q[511:0],1'b0})& q[511:1]) | ((q[511:0] | {q[511:0],1'b0})& (~q[511:1])));
        end
    end

endmodule
