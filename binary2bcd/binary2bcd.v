module binary2bcd(a, b);
input [7 : 0] a;
output [11 : 0] b;
wire [3 : 0] t1, t2, t3, t4, t5, t6, t7;

adder3 add1(
    .x({1'b0, a[7 : 5]}),
    .y(t1[3 : 0])
);
adder3 add2(
    .x({t1[2 : 0], a[4]}),
    .y(t2[3 : 0])
);
adder3 add3(
    .x({t2[2 : 0], a[3]}),
    .y(t3[3 : 0])
);
adder3 add4(
    .x({1'b0, t1[3], t2[3], t3[3]}),
    .y(t4[3 : 0])
);
adder3 add5(
    .x({t3[2 : 0], a[2]}),
    .y(t5[3 : 0])
);
adder3 add6(
    .x({t4[2 : 0], t5[3]}),
    .y(t6[3 : 0])
);
adder3 add7(
    .x({t5[2 : 0], a[1]}),
    .y(t7[3 : 0])
);

assign b = {2'b0, t4[3], t6[3 : 0], t7[3 : 0], a[0]};
endmodule