module top_module( 
    input [31:0] in,
    output [31:0] out );//

    // assign out[31:24] = ...;
    assign out[31:24] = in[7:0];   // Assign in[7:0] to out[31:24]
    assign out[23:16] = in[15:8];  // Assign in[15:8] to out[23:16]
    assign out[15:8]  = in[23:16]; // Assign in[23:16] to out[15:8]
    assign out[7:0]   = in[31:24]; // Assign in[31:24] to out[7:0]

endmodule
