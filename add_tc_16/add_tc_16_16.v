module add_tc_16_16 (
    input   [15:0]  a,
    input   [15:0]  b,

    output  [16:0]  sum
);

wire    [3:0]   p;
wire    [3:0]   g;
wire    [4:1]   c;

add4_head u1_add4_head(
    .a    ( a[3:0]    ),
    .b    ( b[3:0]    ),
    .c_in ( 0 ),
    .f    ( sum[3:0]    ),
    .gm   ( g[0]   ),
    .pm   ( p[0]   ),
    .c_out  (   )
);

add4_head u2_add4_head(
    .a    ( a[7:4]    ),
    .b    ( b[7:4]    ),
    .c_in ( c[1] ),
    .f    ( sum[7:4]    ),
    .gm   ( g[1]   ),
    .pm   ( p[1]   ),
    .c_out  (   )
);

add4_head u3_add4_head(
    .a    ( a[11:8]    ),
    .b    ( b[11:8]    ),
    .c_in ( c[2] ),
    .f    ( sum[11:8]    ),
    .gm   ( g[2]   ),
    .pm   ( p[2]   ),
    .c_out  (   )
);

add4_head u4_add4_head(
    .a    ( a[15:12]    ),
    .b    ( b[15:12]    ),
    .c_in ( c[3] ),
    .f    ( sum[15:12]    ),
    .gm   ( g[3]   ),
    .pm   ( p[3]   ),
    .c_out  (   )
);


c4 u_c4(
    .p    ( p    ),
    .g    ( g    ),
    .c_in ( 0 ),
    .ci   ( c   ),      //������ǰ��λ�ź�
    .gm   (    ),
    .pm   (    )
);

//c[4]��a[15]��b[15]��ӵĽ�λ��������λ��ӵĽ�λ
//Ҫ����sum[16]ֻ��Ҫ��չa��b�ķ���λ��a[16]��b[16]�ټ���c[4]
assign sum[16] = c[4] | (a[15] == 1'b0 ? 1'b0 : 1'b1) | (b[15] == 1'b0 ? 1'b0 : 1'b1);

endmodule