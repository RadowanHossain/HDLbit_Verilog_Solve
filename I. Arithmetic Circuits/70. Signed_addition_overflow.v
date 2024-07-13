module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    assign s = a + b;
    //While adding two 2's complement numbers, overflow can be detected two ways:
    //	1. If carryout and crry-on to  MSB are different then overflow occured
    //  2. If both numbers are +ve and result is-ve or vise versa, overflow occurs
    assign overflow = a[7]&&b[7]&&(~s[7]) || (~a[7])&&(~b[7])&&s[7] ;
endmodule
