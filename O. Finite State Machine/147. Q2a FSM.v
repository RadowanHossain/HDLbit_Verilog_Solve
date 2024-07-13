module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z
  );

    parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101;
    reg [2:0] state, next_state;
    
    always@(*) begin
        case({state, w})
            {A, 1'b0}:  next_state = A;
            {A, 1'b1}:  next_state = B;
            {B, 1'b0}:  next_state = D;
            {B, 1'b1}:  next_state = C;
            {C, 1'b0}:  next_state = D;
            {C, 1'b1}:  next_state = E;
            {D, 1'b0}:  next_state = A;
            {D, 1'b1}:  next_state = F;
            {E, 1'b0}:  next_state = D;
            {E, 1'b1}:  next_state = E;
            {F, 1'b0}:  next_state = D;
            {F, 1'b1}:  next_state = C;
            default : next_state = A;
        endcase
    end
    
    always@(posedge clk) begin
        if(reset)
            state <= A;
        else
            state <= next_state;
    end
    
    assign z = (state == E || state == F);
    
endmodule
