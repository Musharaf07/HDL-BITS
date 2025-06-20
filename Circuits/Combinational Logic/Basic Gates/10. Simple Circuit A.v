module top_module (input x, input y, output z);
    
    wire w1;
    
    assign w1 = x ^ y;
    assign z = w1 & x; 

endmodule
