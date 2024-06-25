module full_adder(
    input a,b,cin,
    output cout,sum);
    assign sum = a+b+cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum
);

    wire [99:0] carry;    

    full_adder fa0 (
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(carry[0])
    );

    genvar i;
    generate
        for (i = 1; i < 100; i = i + 1) begin : adder_inst
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .cin(carry[i-1]),
                .sum(sum[i]),
                .cout(carry[i])
            );
        end
    endgenerate

    assign cout = carry;

endmodule

