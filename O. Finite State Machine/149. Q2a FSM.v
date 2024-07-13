module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter A=2'd0, B=2'd1, C=2'd2, D=2'd3;
    reg [1:0] state, next;
    always@(*)begin
        case(state)
            A : begin
                if(r[1]) next = B;
                else if(~r[1]&r[2]) next = C;
                else if(~r[1]&~r[2]&r[3]) next= D;
                else next= A;
            end
            B : begin
                if(r[1]) next = B;
                else next = A;
            end
            C : begin
                if(r[2]) next = C;
                else next = A;
            end
            D: begin
                if(r[3]) next = D;
                else next = A;
            end
        endcase
    end
        
        always @(posedge clk)begin
            if(~resetn)
                state <= A;
            else
                state <= next;
        end
        
        assign g[1] = (state == B);
        assign g[2] = (state == C);
        assign g[3] = (state == D);
            
                

endmodule
