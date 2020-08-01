 module q7_3 (
     in,
     isfib
 );
     
    input [3:0] in;
    output isfib;

    wire isfib = (~in[3] & ~in[2]) |
                (in[2] & ~in[1] & in[0]) |
                (~in[2] & ~in[1] & ~in[0]);

 endmodule