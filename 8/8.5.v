// 3 -> 8 decoder
module dec_3_8 (
    input [2:0] in,
    output [7:0] out
);
    assign out = 1 <<  in;    
endmodule

// 6 -> 64 decoder using 3 -> 8 predecoders
module dec_6_64 (
    input [5:0] in,
    output [63:0] out
);

    wire[7:0] i, j;

    dec_3_8 dec_38_1(in[5:3], i);
    dec_3_8 dec_38_2(in[2:0], j);

    assign out[63:56] = {8{i[7]}} & j;
    assign out[55:48] = {8{i[6]}} & j;
    assign out[47:40] = {8{i[5]}} & j;
    assign out[39:32] = {8{i[4]}} & j;
    assign out[31:24] = {8{i[3]}} & j;
    assign out[23:16] = {8{i[2]}} & j;
    assign out[15:8]  = {8{i[1]}} & j;
    assign out[7:0]   = {8{i[0]}} & j;

endmodule

module dec_6_64_tb (output [63:0] out);
    reg [5:0] in = 0;

    dec_6_64 dec_664_1(in, out);

    initial begin
        repeat(64) begin
            #100
            $display("in: ", in, " out: ", out);
            in = in + 1;
        end
    end
endmodule