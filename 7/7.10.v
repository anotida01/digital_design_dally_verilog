module q7_10 (in, isfib);
    input [3:0] in;
    output isfib;
    reg isfib;

    always @(*) begin
       casex (in)
            0, 1, 2, 3, 5, 8: isfib = 1'b1;
            4, 6, 7, 9: isfib = 1'b0;
           default: isfib = 1'bx;
       endcase 
    end
endmodule

module q7_10_tb (isfib);
    output isfib;
    reg [3:0] in = 4'b0;

    q7_10 q710(in, isfib);

    initial begin
        repeat(16) begin
            #100
            $display("in: ", in, " out: ", isfib);
            in = in + 1;
        end
    end
endmodule