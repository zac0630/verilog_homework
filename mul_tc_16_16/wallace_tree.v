module wallace_tree(
//    input   [31:0][7:0] prod,
    input   [31:0]      prod0,
    input   [31:0]      prod1,
    input   [31:0]      prod2,
    input   [31:0]      prod3,
    input   [31:0]      prod4,
    input   [31:0]      prod5,
    input   [31:0]      prod6,
    input   [31:0]      prod7,
    
    output  [31:0]      s,
    output  [31:0]      c
    // output  [31:0]  p
);

wire    [31:0]  s_lev01;
wire    [31:0]  c_lev01;
wire    [31:0]  s_lev02;
wire    [31:0]  c_lev02;

wire    [31:0]  s_lev11;
wire    [31:0]  c_lev11;
wire    [31:0]  s_lev12;
wire    [31:0]  c_lev12;

wire    [31:0]  s_lev21;
wire    [31:0]  c_lev21;

wire    [31:0]  s_lev31;
wire    [31:0]  c_lev31;

//level 0 有两个csa压缩器
csa u_csa_lev01(
    .a ( prod0        ),
    .b ( prod1 << 2   ),
    .c ( prod2 << 4   ),
    .s ( s_lev01        ),
    .c_out  ( c_lev01   )
);

csa u_csa_lev02(
    .a ( prod3 << 6   ),
    .b ( prod4 << 8   ),
    .c ( prod5 << 10  ),
    .s ( s_lev02        ),
    .c_out  ( c_lev02   )
);

//level 1 有两个csa压缩器
csa u_csa_lev11(
    .a ( s_lev01        ),
    .b ( c_lev01 << 1   ),
    .c ( s_lev02   ),
    .s ( s_lev11        ),
    .c_out  ( c_lev11   )
);

csa u_csa_lev12(
    .a ( c_lev02 << 1        ),
    .b ( prod6 << 12  ),
    .c ( prod7 << 14   ),
    .s ( s_lev12        ),
    .c_out  ( c_lev12   )
);

//level 2 有一个csa压缩器
csa u_csa_lev21(
    .a ( s_lev11 ),
    .b ( c_lev11 << 1 ),
    .c ( s_lev12 ),
    .s ( s_lev21       ),
    .c_out  ( c_lev21   )
);

//level 3 有一个csa压缩器
csa u_csa_lev31(
    .a ( s_lev21 ),
    .b ( c_lev21 << 1 ),
    .c ( c_lev12 << 1 ),
    .s ( s_lev31       ),
    .c_out  ( c_lev31   )
);

//得到最终的s_lev31和c_lev31（都是32bit） 相加即得结果 使用先行进位加法器
assign  s = s_lev31;
assign  c = c_lev31;


endmodule