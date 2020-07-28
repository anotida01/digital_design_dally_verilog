module q7_15 (
    input [4:0] in,
    output [4:0] out
);
    
    assign out = {in[0], in[1], in[2], in[3], in[4]};

endmodule

module q7_15_tb (output [4:0] out);
    
    reg [4:0] in = 4'b0;
    q7_15 q715(in, out);

    initial begin
        repeat(32) begin
            #100
            $display("in: ", in, " out: ", out);
            in = in + 1;
        end
    end

endmodule