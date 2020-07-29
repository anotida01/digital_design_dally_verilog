// 2-hot 5 -> 4 encoder
module enc_2hot_5_4 (in, out);
    input [4:0] in;
    output [3:0] out;
    reg [3:0] out;

    always @(*) begin
        case (in)
            00011: out = 4'b0000;
            00101: out = 4'b0001;
            00110: out = 4'b0010;
            01010: out = 4'b0011;
            01001: out = 4'b0100;
            01100: out = 4'b0101;
            10100: out = 4'b0110;
            10010: out = 4'b0111;
            10001: out = 4'b1000;
            11000: out = 4'b1001;
            default: out = 4'bx;
        endcase
    end
endmodule
