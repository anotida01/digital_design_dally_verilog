module dec_2_4 (
    input [1:0] in,
    output [3:0] out
);
    assign out = 1 <<  in;    
endmodule

module dec_6_64 (
    input [5:0] in,
    output [63:0] out
);

    wire [3:0] i, j, k;

    dec_2_4 dec_24_1(in[5:4], i);
    dec_2_4 dec_24_2(in[3:2], j);
    dec_2_4 dec_24_3(in[1:0], k);

    assign out[63:60] = {4{i[3]}} & {4{j[3]}} & k;
    assign out[59:56] = {4{i[3]}} & {4{j[2]}} & k;
    assign out[55:52] = {4{i[3]}} & {4{j[1]}} & k;
    assign out[51:48] = {4{i[3]}} & {4{j[0]}} & k;
    assign out[47:44] = {4{i[2]}} & {4{j[3]}} & k;
    assign out[43:40] = {4{i[2]}} & {4{j[2]}} & k;
    assign out[39:36] = {4{i[2]}} & {4{j[1]}} & k;
    assign out[35:32] = {4{i[2]}} & {4{j[0]}} & k;
    assign out[31:28] = {4{i[1]}} & {4{j[3]}} & k;
    assign out[27:24] = {4{i[1]}} & {4{j[2]}} & k;
    assign out[23:20] = {4{i[1]}} & {4{j[1]}} & k;
    assign out[19:16] = {4{i[1]}} & {4{j[0]}} & k;
    assign out[15:12] = {4{i[0]}} & {4{j[3]}} & k;
    assign out[11:8]  = {4{i[0]}} & {4{j[2]}} & k;
    assign out[7:4]   = {4{i[0]}} & {4{j[1]}} & k;
    assign out[3:0]   = {4{i[0]}} & {4{j[0]}} & k;

endmodule

module dec_6_64_1_tb (output [63:0] out);
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