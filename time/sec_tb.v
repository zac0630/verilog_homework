module sec_tb();

reg clk;
reg rst_n;
reg clear;
reg start_stop;

wire [3:0] sec_h;
wire [3:0] sec_l;
wire       add_min_l;

sec u_sec(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .clear      ( clear      ),
    .start_stop ( start_stop ),
    .sec_h      ( sec_h      ),
    .sec_l      ( sec_l      ),
    .add_min_l  ( add_min_l  )
);

always #5 clk <= ~ clk;

initial
begin
    clk <= 1'b1;
    rst_n <= 1'b0;
    clear <= 1'b0;
    start_stop <= 1'b0;
    #100 rst_n <= 1'b1;
    #100 start_stop <= 1'b1;
    #10 start_stop <= 1'b0;
    #1000 clear <= 1'b1;
    #10 clear <= 1'b0;  //清零
    #100 start_stop <= 1'b1;   //重新开始
    #10 start_stop <= 1'b0;
    #1000 start_stop <= 1'b1;    //暂定;
    #10 start_stop <= 1'b0;
    #100;   //暂定
    #10 start_stop <= 1'b1; //继续开始计数
    #10 start_stop <= 1'b0;
    #1000 $stop;
end

endmodule
