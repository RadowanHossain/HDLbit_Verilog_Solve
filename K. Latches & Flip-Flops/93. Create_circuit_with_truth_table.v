module top_module (
    input clk,
    input j,
    input k,
    output Q);
    wire w1,w2,w3;    
    assign w1 = j&~Q,
        w2= ~k&Q,
        w3=w1|w2;
    always @(posedge clk)begin
        Q <=w3;
    end
endmodule
