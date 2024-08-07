module top_module( 
    input [2:0] in,
    output reg [1:0] out
);
    integer i;
    always @* begin
        out = 2'b00;        
        for (i = 0; i < 3; i = i + 1) begin
            if (in[i]) begin
                out = out + 1;
            end
        end
    end

endmodule
