module mul_tc_16_16_tb();

reg [15:0]  a;
reg [15:0]  b;
wire    [31:0]  product;
mul_tc_16_16 mul_tc_16_16(
    .a(a),
    .b(b),

    .product(product)
);

initial begin
#100    a <= 16'b0110000010000000;  b <= 16'b1000000000000001;
end
endmodule