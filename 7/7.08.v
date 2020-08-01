module q7_8 (in, out);
    input [3:0] in;
    output out;
    reg out;
    always @(*) begin
       case (in)
           3, 6, 9, 12, 15: out = 1'b1;
           default: out = 1'b0;
       endcase 
    end
endmodule