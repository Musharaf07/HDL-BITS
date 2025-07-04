module top_module(
    input clk,
    input in,
    input reset,
    output out); 
    
    reg [1:0]state, next_state;
    parameter A = 0, B = 1, C = 2, D = 3;
    
    always@(*) begin
        case(state)
            A : next_state = in ? B : A;
            B : next_state = in ? B : C;
            C : next_state = in ? D : A;
            D : next_state = in ? B : C;
            default : next_state = A;
        endcase
    end
    
    always@(posedge clk) begin
        if(reset)
            state <= A;
        else
            state <= next_state;
    end
    
    assign out = (state==D);

endmodule
