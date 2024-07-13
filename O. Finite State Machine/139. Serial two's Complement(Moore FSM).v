module top_module (
    input clk,
    input areset,
    input x,
    output z
);
        parameter A=2'b00, B=2'b01, C=2'b10;
    reg [1:0] state, state_next;
    
    always @(posedge clk or posedge areset)
        begin
            if (areset)
            state <= A;
    		else
            state <= state_next;
    	end
    always @(*)begin
        case(state)
            A : state_next = (x)? B:A;
            B : state_next = (x) ? C:B;
            C : state_next = (x)? C:B;
            default: state_next = A;
        endcase
    end
    assign z = (state == B);

endmodule
