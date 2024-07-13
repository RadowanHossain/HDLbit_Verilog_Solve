module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
);  parameter A=4'd0, f1=4'd1, temp1=4'd2, temp2=4'd3, temp3=4'd4, g1=4'd5, g1p=4'd6, temp4=4'd7, gop=4'd8;
    reg [3:0] state, next;
    always@(*)begin
        case(state)
            A: next = (resetn)? f1:A;
            f1 : next = temp1;
            temp1: next = (x)? temp2:temp1;
            temp2 : next = (x)? temp2: temp3;
            temp3: next = (x)? g1:temp1;
            g1 : next = (y)? g1p: temp4;
            temp4 : next = (y)? g1p: gop;
            g1p : next = (resetn)? g1p: A;
            gop: next = (resetn)? gop: A;
        endcase
    end
    always@(posedge clk) begin
        if(~resetn)
            state <= A;
        else
            state <= next;
    end
    always@(posedge clk) begin
        case(next)
            f1:     f <= 1'b1;
            g1:		g <= 1'b1;
            temp4:	g <= 1'b1;
            g1p:    g <= 1'b1;
            gop:    g <= 1'b0;
            default: begin
                    f <= 1'b0;
                    g <= 1'b0;
            end
        endcase
    end     
endmodule
