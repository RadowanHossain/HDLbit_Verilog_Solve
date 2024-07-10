module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: next_state = f(state, in)
    always @(*)begin
        case(state)
            A: next_state = (in==2'b01)? B:A;
            B: next_state = (in==2'b01)? B:C;
            C: next_state = (in==2'b01)? D:A;
            D: next_state = (in==2'b01)? B:C;
        endcase
    end
    assign out = (state==D);          
             
endmodule
