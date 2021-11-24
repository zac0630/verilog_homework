/*a�Ǳ����������ݵõ���booth����������ֻ�*/
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
    if(zero == 1'b1)begin                       //����ֵ��0��ֱ������
        prod_pre <= 32'b0;
    end
    else if(one == 1'b1)begin                   //����ֵ��1��ԭ��������Ҫ��չ����λ
        prod_pre <= {{16{a[15]}},a };
    end
    else if(two == 1'b1)                        //����ֵ��2������һλ������չ����λ
        prod_pre <= {{15{a[15]}}, a, 1'b0};
end

assign prod = neg ? (~prod_pre + 1'b1) : prod_pre;      //���ֻ��ǲ��룬neg��1��Ҫȡ����1

endmodule