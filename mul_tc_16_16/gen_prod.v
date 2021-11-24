/*a是被乘数，根据得到的booth编码产生部分积*/
module gen_prod(
    input   [15:0]  a,
    input           neg,
    input           zero,
    input           one,
    input           two,
    output          [31:0]  prod
);

reg    [31:0]  prod_pre;

always @(*) begin
    prod_pre <= 32'b0;
    if(zero == 1'b1)begin                       //绝对值是0，直接置零
        prod_pre <= 32'b0;
    end
    else if(one == 1'b1)begin                   //绝对值是1，原数，但是要拓展符号位
        prod_pre <= {{16{a[15]}},a };
    end
    else if(two == 1'b1)                        //绝对值是2，左移一位，再拓展符号位
        prod_pre <= {{15{a[15]}}, a, 1'b0};
end

assign prod = neg ? (~prod_pre + 1'b1) : prod_pre;      //部分积是补码，neg是1，要取反加1

endmodule