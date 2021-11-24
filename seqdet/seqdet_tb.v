module seqdet_tb ();

reg     clk;
reg     rst_n;
reg     din_vld;
reg     din;
wire    result;

seqdet u_seqdet(
    .clk     ( clk     ),
    .rst_n   ( rst_n   ),
    .din_vld ( din_vld ),
    .din     ( din     ),
    .result  ( result  )
);

always #5 clk <=~clk;

initial
begin
    clk <= 1'b1;
    rst_n <= 1'b0;
    din <= 1'b0;
    din_vld <= 1'b0;
    #20 rst_n <= 1'b1;
    #10 din_vld <= 1'b1;
        din <= 1'b0;
    #10 din <= 1'b0;
    #10 din <= 1'b1;
    #10 din <= 1'b1;
    #10 din <= 1'b1;
    #10 din <= 1'b0;
    #10 din <= 1'b0;
    #10 din <= 1'b0;
    #10 din <= 1'b1;
    #10 din <= 1'b1;
    #10 din <= 1'b0;
    #10 din <= 1'b1;
    #10 din <= 1'b1;
    #10 din <= 1'b1;
    #10 din <= 1'b0;
    #10 din <= 1'b0;
    #10 din <= 1'b0;
end

endmodule