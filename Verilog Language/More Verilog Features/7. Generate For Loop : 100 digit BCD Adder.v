module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0] cout0;
    genvar i;
    generate
        bcd_fadd bcd(a[3:0], b[3:0], cin, cout0[0], sum[3:0]);
        for(i = 4; i < 400; i = i + 4) 
            begin : bcdadder
                bcd_fadd bcdadd(a[i+3 : i], b[i+3 : i], cout0[i/4-1], cout0[i/4], sum[i+3:i]);
            end
    endgenerate
    
    assign cout = cout0[99];

endmodule
