module q7_4 (
    in,
    isfib
);
    input [3:0] in;
    output isfib;

    wire a1, a2, a3;

    and and1(a1, ~in[3], ~in[2]);
    and and2(a2, in[2], ~in[1], in[0]);
    and and3(a3, ~in[2], ~in[1], ~in[0]);
    or or1(isfib, a1, a2, a3);

endmodule