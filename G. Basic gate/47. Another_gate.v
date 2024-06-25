module top_module (
    input in1,
    input in2,
    output out);
    wire a;
    assign a= ~in2;
    assign out = in1 & a;

endmodule
