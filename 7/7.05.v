module fibonacci_tb (in_tb, out);

    output in_tb;
    output out;
    reg [3:0] in_tb; // reg because it's not an input to this module
    wire out;

    q7_4 f1(in_tb, out);

    initial begin
        in_tb = 4'b0;
        repeat (16) begin
            #100 // need that delay inbetween changing signals
            $display("in: ", in_tb, " out: ", out);
            in_tb = in_tb + 1;
        end
    end

endmodule