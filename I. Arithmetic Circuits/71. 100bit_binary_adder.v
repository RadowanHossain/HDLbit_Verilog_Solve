module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    wire [98:0] con1;    
    FA f1(a[0],b[0],cin,con1[0],sum[0]);
    FA f2(a[99],b[99],con1[98],cout,sum[99]);   
    genvar i;
    generate
        for(i=1;i<99;i++) begin : Full_adder_block
            FA fa(a[i],b[i],con1[i-1],con1[i],sum[i]);
        end
    endgenerate

endmodule

module FA (
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum);
    assign sum = a ^ b ^ cin;
    assign cout = (a&b) | (b&cin) | (cin&a) ;
    
endmodule

                  //more easiest way
//module top_module (
//	input [99:0] a,
//	input [99:0] b,
//	input cin,
//	output cout,
//	output [99:0] sum
//);

	// The concatenation {cout, sum} is a 101-bit vector.
//	assign {cout, sum} = a+b+cin;

//endmodule

    
