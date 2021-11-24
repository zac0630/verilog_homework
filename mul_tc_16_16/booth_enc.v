module booth_enc(
    input   [2:0]   code,   //输入的码字
    output          neg,    //符号
    output          zero,   //绝对值是否是0
    output          one,    //绝对值是否是1
    output          two     //绝对值是否是2
);

assign  neg = code[2];
assign  zero = (code == 3'b000) || (code == 3'b111);    //绝对值是0
assign  two  = (code == 3'b100) || (code == 3'b011);    //绝对值是1
assign  one  = !zero & !two;

endmodule