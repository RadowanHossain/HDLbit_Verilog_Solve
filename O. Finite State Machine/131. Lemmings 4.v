module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    localparam [2:0] LEFT = 3'b000,
                     RIGHT = 3'b001,
                     FALL_L = 3'b010,
                     FALL_R = 3'b011,
                     DIG_L  = 3'b100,
                     DIG_R  = 3'b101,
                     SPLATTER = 3'b110;

    reg [2:0] state, next;
    reg [6:0] count;
   	always @(posedge clk or posedge areset) begin
        if(areset) state <= LEFT;
        else if(state == FALL_R || state == FALL_L) begin
            count <= count + 1;
            state <= next;
        end
        else begin
            state <= next;
            count <= 0;
        end       
    end
    
    always @(*)begin
        case(state)
            LEFT : next = (ground==0)? FALL_L : ( (dig==1)? DIG_L :((bump_left==1)? RIGHT:LEFT) );
            RIGHT : next = (ground==0)? FALL_R : ((dig==1)? DIG_R :((bump_right==1)? LEFT:RIGHT) );	
            FALL_L : next =(ground==1)? ((count>19)? SPLATTER:LEFT): FALL_L ;
            FALL_R : next =(ground==1)? ((count>19)? SPLATTER:RIGHT): FALL_R ;
            DIG_L : next =(ground==1)? DIG_L:FALL_L;
            DIG_R : next = (ground==1)? DIG_R:FALL_R;
            SPLATTER : next = SPLATTER;
        endcase
    end
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = ((state == FALL_L) || (state == FALL_R));
    assign digging = ((state == DIG_L) || (state == DIG_R));
endmodule
