/*3:2进位保存加法器*/
/*通过32个1bit全加器实现*/
module csa(
    input   [31:0]  a,      //输入3个16bit数
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