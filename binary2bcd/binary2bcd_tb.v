module binary2bcd_tb();

reg [7 : 0] a;
wire [9 : 0] b;     
reg     clk;

binary2bcd binary2bcd
(
    .a(a),
    .b(b)
);

always #5 clk<= ~clk;

initial
begin
    a <= 0; clk <= 1'b0;
    #10 a <= 8'd165;
    #10 a <= 8'd240;
    
end


endmodule