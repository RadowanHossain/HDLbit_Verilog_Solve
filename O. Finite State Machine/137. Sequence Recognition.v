module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    localparam [3:0] NONE=4'b0000,
    				ONE = 4'b0001,
    				TWO = 4'b0010,	
    				THREE = 4'b0011,
    				FOUR = 4'b0100,
    				FIVE = 4'b0101,
    				SIX = 4'b0110,
    				ERROR = 4'b0111,
    				DISCARD = 4'b1000,
    				FLAG = 4'b1001;
    reg [3:0] state, next;
    always @(*)begin
        case(state)
            NONE : next = (in)? ONE: NONE;
            ONE : next = (in)? TWO: NONE;
            TWO : next = (in)? THREE: NONE;
            THREE : next = (in)? FOUR: NONE;
            FOUR : next = (in)? FIVE: NONE;
            FIVE : next = (in)? SIX: DISCARD;
            SIX : next = (in)? ERROR : FLAG;
            ERROR : next = (in)? ERROR : NONE;
            DISCARD: next  = (in)? ONE: NONE;
            FLAG : next = (in)? ONE: NONE;
        endcase
    end
    always @(posedge clk)begin
        if(reset)
            state <= 4'b0000;
        else 
            state <= next;
    end
    assign disc = (state==DISCARD);
    assign flag = (state == FLAG);
    assign err = (state == ERROR);
            

endmodule
