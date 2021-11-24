//4λ��ǰ��λ
module c4(
    input   [3:0]   p,      //����4��1λȫ�����Ĵ����ź�
    input   [3:0]   g,      //����4��1λȫ�����������ź�
    input           c_in,   //���ս�λ�ź�

    output  [4:1]   ci,     //���4����ǰ��λ�ź�
    output  gm,             //4λ��ǰ��λ���������ź�
    output  pm              //4λ��ǰ��λ���Ĵ����ź�
);

assign ci[1] = g[0] | p[0] & c_in;
assign ci[2] = g[1] | p[1] & g[0] | p[1] & p[0] & c_in;
assign ci[3] = g[2] | p[2] & g[1] | p[2] & p[1] & g[0] | p[2] & p[1] & p[0] & c_in;
assign ci[4] = g[3] | p[3] & g[2] | p[3] & p[2] & g[1] | p[3] & p[2] & p[1] & g[0] | p[3] & p[2] & p[1] & p[0] & c_in;

assign gm = g[3] | p[3] & g[2] | p[3] & p[2] & g[1] | p[3] & p[2] & p[1] & g[0];
assign pm = &p;

endmodule
