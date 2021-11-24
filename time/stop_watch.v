module stop_watch(
    input   clk,
    input   rst_n,
    input   clear,
    input   start_stop,
    
    output  [3:0]   hr_h,
    output  [3:0]   hr_l,
    output  [3:0]   min_h,
    output  [3:0]   min_l,
    output  [3:0]   sec_h,
    output  [3:0]   sec_l
);

wire    add_min_l;
wire    add_hour_l;

//sec范围是00~59
sec u_sec(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .clear      ( clear      ),
    .start_stop ( start_stop ),
    .sec_h      ( sec_h      ),
    .sec_l      ( sec_l      )
);

//min是00~59
//只有当sec为59时，才会给一个clk的使能信号，让min加1
assign add_min_l = ((sec_h == 4'd5) && (sec_l == 4'd9));

min u_min(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .clear      ( clear      ),
    .add_min_l  ( add_min_l ),
    .min_h      ( min_h      ),
    .min_l      ( min_l      )
);

//hour范围是00~23
//只有当min是59且add_min_l为1'b1，才会产生进位
assign add_hour_l = ((min_h == 4'd5) && (min_l == 4'd9)) && add_min_l;      //只有在59分钟的最后一次分钟进位才会产生小时进位

hour u_hour(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .clear      ( clear      ),
    .add_hour_l  ( add_hour_l ),
    .hour_h      ( hr_h      ),
    .hour_l      ( hr_l      )
);


endmodule