/*1Î»È«¼ÓÆ÷*/
module add_full(
    input   a,
    input   b,
    input   cin,
    output  cout,
    output  s
);

assign s = a ^ b ^ cin;
assign cout = a & b | (cin & (a ^ b));

endmodule