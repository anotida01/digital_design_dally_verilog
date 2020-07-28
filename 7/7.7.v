module q7_7 (in, isprime);
    input [4:0] in;
    output isprime;
    reg isprime;
    always @(*) begin
       case (in)
           2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31: isprime = 1'b1;
           default: isprime = 1'b0;
       endcase 
    end
endmodule