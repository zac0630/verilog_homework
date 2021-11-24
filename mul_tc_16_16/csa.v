/*3:2��λ����ӷ���*/
/*ͨ��32��1bitȫ����ʵ��*/
module csa(
    input   [31:0]  a,      //����3��16bit��
    input   [31:0]  b,
    input   [31:0]  c,
    output  [31:0]  s,
    output  [31:0]  c_out
);

genvar i;
generate
    for(i = 0; i < 32; i=i+1)begin
        add_full u_add_full(
            .a      (   a[i]        ),
            .b      (   b[i]        ),
            .cin    (   c[i]        ),
            .cout   (   c_out[i]    ),
            .s      (   s[i]        )
        );
    end
endgenerate

endmodule