module top_module();
    reg [1:0] in;
    wire out;
    
    andgate and0(.in(in),.out(out));
    
    initial begin
        in = 00; #10;
        in = 01; #10;
        in = 10; #10;
        in = 11; 
    end
endmodule
