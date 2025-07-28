module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    reg [1:0] state, nxt_state;
    parameter L = 2'b00, R = 2'b01, FL = 2'b10, FR = 2'b11;
    
    always @(posedge clk or posedge areset)
        if (areset)
            state <= L;
    else state <= nxt_state;

    always @(*)
        case (state)
            L: nxt_state = ~ground ? FL : (bump_left ? R : L);
            R: nxt_state = ~ground ? FR : (bump_right ? L : R);
            FL: nxt_state = ground ? L : FL;
            FR: nxt_state = ground ? R : FR;
            default: nxt_state = L;
            endcase
    assign walk_left = state == L;
    assign walk_right = state == R;
    assign aaah = state == FL || state == FR;

endmodule
