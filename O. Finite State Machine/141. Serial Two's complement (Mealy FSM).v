module top_module (
    input clk,
    input areset,
    input x,
    output reg z
); 
    parameter [1:0] A = 2'b01, B = 2'b10;
    reg [1:0] state, next;

    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= A;
        else
            state <= next;
    end

    always @(*) begin
        case (state)
            A: begin
                next = (x) ? B : A;
                z = (x) ? 1 : 0;
            end
            B: begin
                next = B;
                z = (x) ? 0 : 1;
            end
        endcase
    end
endmodule
