module add_full1(
    input   a,      //输入
    input   b,
    input   c_in,   //输入的进位
    output  f,      //1位加的结果
    output  g,      //生成信号  g = a * b
    output  p       //传播信号  p = a + b
);

assign f = a ^ b ^ c_in;
assign g = a & b;
assign p = a | b;

endmodule