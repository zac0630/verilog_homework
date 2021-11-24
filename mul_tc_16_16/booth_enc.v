module booth_enc(
    input   [2:0]   code,   //���������
    output          neg,    //����
    output          zero,   //����ֵ�Ƿ���0
    output          one,    //����ֵ�Ƿ���1
    output          two     //����ֵ�Ƿ���2
);

assign  neg = code[2];
assign  zero = (code == 3'b000) || (code == 3'b111);    //����ֵ��0
assign  two  = (code == 3'b100) || (code == 3'b011);    //����ֵ��1
assign  one  = !zero & !two;

endmodule