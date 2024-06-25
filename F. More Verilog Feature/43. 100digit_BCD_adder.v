module top_module(
    input [399:0] a,
    input [399:0] b,
    input cin,
    output cout,
    output [399:0] sum
);
    wire [99:0] carry; // Intermediate carry signals

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin: bcd_adder_gen
            if (i == 0) begin
                // The first instance uses the external carry-in (cin)
                bcd_fadd u_bcd_fadd (
                    .a(a[3:0]),
                    .b(b[3:0]),
                    .cin(cin),
                    .cout(carry[0]),
                    .sum(sum[3:0])
                );
            end else begin
                // Subsequent instances use the carry-out from the previous instance
                bcd_fadd u_bcd_fadd (
                    .a(a[i*4 +: 4]),
                    .b(b[i*4 +: 4]),
                    .cin(carry[i-1]),
                    .cout(carry[i]),
                    .sum(sum[i*4 +: 4])
                );
            end
        end
    endgenerate

    assign cout = carry[99]; // The final carry-out
endmodule
