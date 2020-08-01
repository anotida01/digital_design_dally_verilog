module q7_1 (
    in,
    isfib
);
    input [3:0] in;
    output isfib;
    reg isfib;

    always @(in) begin 
        case (in)
            0, 1, 2, 3, 5, 8, 13: isfib = 1'b1;
            default: isfib = 1'b0;
        endcase
    end
    
endmodule
