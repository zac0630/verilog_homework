//�ָ���1λȫ������4λ��ǰ��λģ��
//����4λ��ǰ�ӷ���
module add4_head (
    input   [3:0]   a,      //����4λ��
    input   [3:0]   b,
    input           c_in,   //�����0λ�Ľ�λ

    output  [3:0]   f,      //���4λ�ӷ��Ľ��
    output          gm,     //���4λ�ӷ����Ĳ����ź�
    output          pm,     //���4λ�ӷ����Ĵ����ź�
    output          c_out   //���4λ�ӷ����Ľ�λ
);

wire        [3:0]   g;
wire        [3:0]   p;
wire        [4:1]   c;

//1λȫ����ֻ���� 1λ�ӷ������g��p
add_full1 u1_add_full1(
    .a    ( a[0]    ),
    .b    ( b[0]    ),
    .c_in ( c_in ),
    .f    ( f[0]    ),
    .g    ( g[0]    ),
    .p    ( p[0]    )
);

add_full1 u2_add_full1(
    .a    ( a[1]    ),
    .b    ( b[1]    ),
    .c_in ( c[1] ),
    .f    ( f[1]    ),
    .g    ( g[1]    ),
    .p    ( p[1]    )
);

add_full1 u3_add_full1(
    .a    ( a[2]    ),
    .b    ( b[2]    ),
    .c_in ( c[2] ),
    .f    ( f[2]    ),
    .g    ( g[2]    ),
    .p    ( p[2]    )
);

add_full1 u4_add_full1(
    .a    ( a[3]    ),
    .b    ( b[3]    ),
    .c_in ( c[3] ),
    .f    ( f[3]    ),
    .g    ( g[3]    ),
    .p    ( p[3]    )
);

c4 u_c4(
    .p    ( p    ),
    .g    ( g    ),
    .c_in ( c_in ),
    .ci   ( c   ),
    .gm   ( gm   ),
    .pm   ( pm   )
);

assign c_out = c[4];

endmodule