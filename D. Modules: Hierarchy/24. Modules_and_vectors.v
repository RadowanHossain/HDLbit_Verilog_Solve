module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire[7:0] a, b, c;
    my_dff8 inst1 (clk, d, a);
    
    my_dff8 inst2 (clk,a,b);
    my_dff8 inst3 (clk,b,c);
    
    always @(*)
        case(sel)
            2'h0: q = d;
            2'h1: q = a;
            2'h2: q = b;
            2'h3: q = c;
        endcase          
    

endmodule
