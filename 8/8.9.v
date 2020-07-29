module enc_16_4 (in, out);
    input [15:0] in;
    output [3:0] out;
    reg [3:0] out;

    always @(*) begin
        casex (in)
            1: out = 4'b0000;
            2: out = 4'b0001;
            4: out = 4'b0010;
            8: out = 4'b0011;
            16: out = 4'b0100;
            32: out = 4'b0101;
            64: out = 4'b0110;
            128: out = 4'b0111;
            256: out = 4'b1000;
            512: out = 4'b1001;
            1024: out = 4'b1010;
            2048: out = 4'b1011;
            4096: out = 4'b1100;
            8192: out = 4'b1101;
            16384: out = 4'b1110;
            32768: out = 4'b1111;
            default: out = 4'bx;
        endcase
    end

endmodule

module dec_4_16 (in, out);
    input [3:0] in;
    output [15:0] out;
    
    wire [15:0] out = 1 << in;

endmodule

module dec_4_16_tb() ;
    reg out;
    reg [3:0] in;

    wire [3:0] enc_out;
    wire [15:0] dec_out;

    dec_4_16 dec_4_16_1(in, dec_out);
    enc_16_4 enc_16_4_1(dec_out, enc_out);

    initial begin
        out = 0; in = 0;
        repeat(16) begin
            #100
            out = 1'b0;
            if (in == enc_out) begin
                assign out = 1'b1;
            end
            $display("in: ", in, " dec_out: ", dec_out, " enc_out: ", enc_out, " MATCH: ", out);
            in = in + 1;
        end
    end

endmodule