// two-hot 4 -> 5 decoder
module dec_2hot_4_5 (in, out);
    input [3:0] in;
    output [4:0] out;
    reg [4:0] out;

    always @(*) begin
        casex (in)
            0: out = 5'b00011;
            1: out = 5'b00101;
            2: out = 5'b00110;
            3: out = 5'b01010;
            4: out = 5'b01001;
            5: out = 5'b01100;
            6: out = 5'b10100;
            7: out = 5'b10010;
            8: out = 5'b10001;
            9: out = 5'b11000;
            default: out = 5'bx;
        endcase
    end

endmodule

module dec_2hot_4_5_tb (out);
    reg [3:0] in = 0;
    output [4:0] out;

    dec_2hot_4_5 dec45_1(in, out);

    initial begin
        repeat(16) begin
            #100
            $display("in: ", in, " out: ", out);
            in = in + 1;
        end
    end

endmodule