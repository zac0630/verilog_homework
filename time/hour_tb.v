module sec_tb();

reg clk;
reg rst_n;
reg clear;
reg start_stop;

wire [3:0] sec_h;
wire [3:0] sec_l;
wire       add_min_l;

wire [3:0] min_h;
wire [3:0] min_l;
wire       add_hour_l;

wire [3:0] hour_h;
wire [3:0] hour_l;

sec u_sec(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .clear      ( clear      ),
    .start_stop ( start_stop ),
    .sec_h      ( sec_h      ),
    .sec_l      ( sec_l      )
    //.add_min_l  ( add_min_l  )
);

assign add_min_l = ((sec_h == 4'd5) && (sec_l == 4'd9));

min u_min(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .clear      ( clear      ),
    .add_min_l  ( add_min_l ),
    .min_h      ( min_h      ),
    .min_l      ( min_l      )
    //.add_hour_l  ( add_hour_l  )
);

assign add_hour_l = ((min_h == 4'd5) && (min_l == 4'd9)) && add_min_l;      //只有在59分钟的最后一次分钟进位才会产生小时进位


hour u_hour(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .clear      ( clear      ),
    .add_hour_l  ( add_hour_l ),
    .hour_h      ( hour_h      ),
    .hour_l      ( hour_l      )
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
    //#100000 $stop;
end

endmodule
