module top_module ();
    reg clk, reset, t;
    wire q;
    
    tff tff0(.clk(clk), .reset(reset), .t(t), .q(q));
    
    initial begin
        clk = 0;
        reset = 0; #5;
        reset = 1; #10;
        reset = 0;
    end
    
    always@(posedge clk)begin
        if(reset)
            t <= 0;
        else
            t <= 1;
    end
    
    always #5 clk = ~clk;
                
endmodule
