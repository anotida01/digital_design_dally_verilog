// 2 -> 4 decoder
module dec_2_4 (
    input [1:0] in,
    output [3:0] out
);
    assign out = 1 <<  in;    
endmodule

module dec_3_8 (
    input [2:0] in,
    output [7:0] out
);
    assign out = 1 <<  in;    
endmodule

module dec_5_32 (in, out);  

    input [4:0] in;
    output [31:0] out;

    wire [31:0] out;
    wire [7:0] i;
    wire [3:0] j;

    // instantiate precoders
    dec_3_8 dec38(in[4:2], i);
    dec_2_4 dec24(in[1:0], j);

    assign out[31:28] = {4{i[7]}} & j;
    assign out[27:24] = {4{i[6]}} & j;
    assign out[23:20] = {4{i[5]}} & j;
    assign out[19:16] = {4{i[4]}} & j;
    assign out[15:12] = {4{i[3]}} & j;
    assign out[11:8]  = {4{i[2]}} & j;
    assign out[7:4]   = {4{i[1]}} & j;
    assign out[3:0]   = {4{i[0]}} & j;
    
endmodule

module dec_5_32_tb (output [31:0] out);
    reg [4:0] in = 0;

    dec_5_32 dec532(in, out);

    initial begin
        repeat(32) begin
            #100
            $display("in: ", in, " out: ", out);
            in = in + 1;
        end
    end
endmodule