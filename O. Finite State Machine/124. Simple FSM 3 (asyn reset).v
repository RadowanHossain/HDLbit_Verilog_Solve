module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    parameter A=1,B=2,C=3,D=4;
    reg [2:0] state, next_state;
    always @(*)begin
        case(state)
            A: next_state = (in==1)? B:A;
            B: next_state = (in==1)? B:C;
            C: next_state = (in==1)? D:A;
            D: next_state = (in==1)? B:C;
        endcase
    end
    always @(posedge clk or posedge areset)begin
        if(areset)
            state <= A;
        else
            state <= next_state;
    end
    assign out = (state==D);
endmodule
