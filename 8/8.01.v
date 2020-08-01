// 3 -> 8 decoder structural desc
module dec38 (in, out);
    input [2:0] in;
    output [7:0] out;
    wire [7:0] out;

    assign out[7] = ( in[0]  &  in[1]  &  in[2]);
    assign out[6] = (~in[0]  &  in[1]  &  in[2]);
    assign out[5] = ( in[0]  & ~in[1]  &  in[2]);
    assign out[4] = (~in[0]  & ~in[1]  &  in[2]);
    assign out[3] = ( in[0]  &  in[1]  & ~in[2]);
    assign out[2] = (~in[0]  &  in[1]  & ~in[2]);
    assign out[1] = ( in[0]  & ~in[1]  & ~in[2]);
    assign out[0] = (~in[0]  & ~in[1]  & ~in[2]);
endmodule

module de38_tb (out);
    reg [2:0] in = 0;
    output [7:0] out;

    dec38 dec_38_1(in, out);

    initial begin
        repeat(8) begin
            #100
            $display("in: ", in, " out: ", out);
            in = in + 1;
        end
    end
endmodule