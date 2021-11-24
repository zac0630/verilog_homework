module add_full1(
    input   a,      //����
    input   b,
    input   c_in,   //����Ľ�λ
    output  f,      //1λ�ӵĽ��
    output  g,      //�����ź�  g = a * b
    output  p       //�����ź�  p = a + b
);

assign f = a ^ b ^ c_in;
assign g = a & b;
assign p = a | b;

endmodule