// 8 -> 1 binary-select mux with arbritary data channel width
module muxb_8_1 (d0, d1, d2, d3, d4, d5, d6, d7, sb, out);
    parameter k = 1;
    input [k-1:0] d0, d1, d2, d3, d4, d5, d6, d7;
    input [2:0] sb;
    output [k-1:0] out;
    reg [k-1:0] out;

    always @(*) begin
        case (sb)
            0: out = d0;
            1: out = d1;
            2: out = d2;
            3: out = d3;
            4: out = d4;
            5: out = d5;
            6: out = d6;
            7: out = d7;
            default: out = {k{1'bx}};
        endcase
    end
endmodule

// 4-bit is_fib module implemented with 8 -> 1 mux
module isfib_muxb_8_1 (in, out);
    input [3:0] in;
    output out;
    
    // factored truth-table is passed to mux with sliced binary-select signal
    muxb_8_1 #(1) muxb81(1, ~in[3], ~in[3], ~in[3], 0, 1, 0, 0, in[2:0], out);
endmodule

module isfib_muxb_8_1_tb (out);
    reg [3:0] in = 0;
    output out;

    isfib_muxb_8_1 m(in, out);

    initial begin
        repeat(16) begin
            #100
            $display("in: ", in, " out: ", out);
            in = in + 1;
        end
    end
endmodule