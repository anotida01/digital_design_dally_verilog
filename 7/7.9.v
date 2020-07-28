module multiple3_tb (ismul);
    
    output ismul;
    reg [3:0] in = 4'b0;
    q7_8 q78(in, ismul);

    initial begin
        repeat(16) begin
            #100
            $display("in ", in, " out: ", ismul);
            in = in + 1;
        end
    end
endmodule