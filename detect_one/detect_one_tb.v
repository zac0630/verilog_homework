module detect_one_tb();

integer i;

reg     clk;
reg     [31:0] data_in;
wire    [5:0]   pos_out;

detect_one detect_one
(
    .data_in(data_in),
    .pos_out(pos_out)
);

always #5 clk <=~clk;

initial
begin
    i = 0;
    clk <= 1;
    data_in <=0;
    #10;
    repeat(209715002)
    begin
        #10 data_in <= data_in + 1'b1;
        i = i + 1;
    end
end

endmodule