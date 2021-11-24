module mul_tc_16_16(
    input   [15:0]      a,
    input   [15:0]      b,

    output  [31:0]      product
);

//采用4位booth编码，16bit的乘数b能产生8个booth编码
wire    [7:0]   neg;
wire    [7:0]   zero;
wire    [7:0]   one;
wire    [7:0]   two;

//经过wallace_tree会生成s和c（均为32位）
wire    [31:0]  s;
wire    [31:0]  c;

genvar i;
generate
    for(i=0; i<8; i=i+1)begin
        if(i == 0)
            booth_enc u_booth_enc(
                .code   ({b[1:0], 1'b0}),
                .neg    (neg[i]     ),
                .zero   (zero[i]),
                .one    (one[i]),
                .two    (two[i])
            );
        else
            booth_enc u_booth_enc(
                .code   (b[i*2+1:i*2-1]),
                .neg    (neg[i]),
                .zero   (zero[i]),
                .one    (one[i]),
                .two    (two[i])
            );
    end
endgenerate

//有8个booth编码，说明会产生8个部分积
wire    [31:0] prod[7:0];

generate
    for(i=0; i<8; i=i+1)begin
        gen_prod u_gen_prod(
            .a    ( a    ),
            .neg  ( neg[i]  ),
            .zero ( zero[i] ),
            .one  ( one[i]  ),
            .two  ( two[i]  ),
            .prod  ( prod[i]  )
        );
    end
endgenerate


wallace_tree u_wallace_tree(
    .prod0 ( prod[0] ),
    .prod1 ( prod[1] ),
    .prod2 ( prod[2] ),
    .prod3 ( prod[3] ),
    .prod4 ( prod[4] ),
    .prod5 ( prod[5] ),
    .prod6 ( prod[6] ),
    .prod7 ( prod[7] ),
    
    .s    ( s    ),
    .c    ( c    )
);

//最后将s和c传入32位先行进位加法器得出16*16乘法器的结果
//这里简化了
assign product = s + c;

endmodule