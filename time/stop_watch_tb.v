module stop_watch_tb();

reg clk;
reg rst_n;
reg clear;
reg start_stop;

wire [3:0] sec_h;
wire [3:0] sec_l;

wire [3:0] min_h;
wire [3:0] min_l;

wire [3:0] hr_h;
wire [3:0] hr_l;

stop_watch u_stop_watch(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .clear      ( clear      ),
    .start_stop ( start_stop ),
    .hr_h       ( hr_h       ),
    .hr_l       ( hr_l       ),
    .min_h      ( min_h      ),
    .min_l      ( min_l      ),
    .sec_h      ( sec_h      ),
    .sec_l      ( sec_l      )
);

always #5 clk <= ~ clk;

initial
begin
    clk <= 1'b1;
    rst_n <= 1'b0;
    clear <= 1'b0;
    start_stop <= 1'b0;
	//复位结束
    #100 rst_n <= 1'b1;
	//产生一个clk的start_stop，模拟按下暂定开始按钮
    #100 start_stop <= 1'b1;
    #10 start_stop <= 1'b0;
	//经过1000 按下清空按钮，查看是否输出为0
    #1000 clear <= 1'b1;
    #10 clear <= 1'b0;
	//按下暂定开始按钮，重新开始计时
    #100 start_stop <= 1'b1;
    #10 start_stop <= 1'b0;
	//经过1000 暂定
    #1000 start_stop <= 1'b1;
    #10 start_stop <= 1'b0;
	//经过100，产看输出是否能维持不变
    #100;
	//结束暂定，开始计时
    #10 start_stop <= 1'b1;
    #10 start_stop <= 1'b0;
	//经过10000000，查看输出秒分时进位是否有错
    //#10000000 $stop;
end


endmodule