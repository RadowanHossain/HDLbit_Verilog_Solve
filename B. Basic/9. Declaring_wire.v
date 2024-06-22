`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire one_wire;
    wire two_wire;
    assign out= one_wire | two_wire;
    assign out_n = ~(one_wire | two_wire);
    assign one_wire = a & b;
    assign two_wire = c & d;

endmodule
