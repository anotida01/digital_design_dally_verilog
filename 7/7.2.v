module q7_2 (
    in,
    isfib
);
    
    input [3:0] in;
    output isfib;
    reg isfib;

    always @(in) begin 
        casex (in)
            4'b00XX : isfib = 1'b1;
            4'bX101 : isfib = 1'b1;
            4'bX000 : isfib = 1'b1;
            default : isfib = 1'b0;
        endcase
    end

endmodule