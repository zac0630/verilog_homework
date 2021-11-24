module add_tc_16_16_tb ();

reg [15:0] a;
reg [15:0] b;
wire [16:0] sum;

add_tc_16_16 u_add_tc_16_16(
    .a ( a ),
    .b ( b ),
    .sum  ( sum  )
);

initial begin
#100 a <= 16'b0110000010000000; b <= 16'b1000000000000001;
end

    
endmodule