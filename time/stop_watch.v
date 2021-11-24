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

//sec��Χ��00~59
sec u_sec(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .clear      ( clear      ),
    .start_stop ( start_stop ),
    .sec_h      ( sec_h      ),
    .sec_l      ( sec_l      )
);

//min��00~59
//ֻ�е�secΪ59ʱ���Ż��һ��clk��ʹ���źţ���min��1
assign add_min_l = ((sec_h == 4'd5) && (sec_l == 4'd9));

min u_min(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .clear      ( clear      ),
    .add_min_l  ( add_min_l ),
    .min_h      ( min_h      ),
    .min_l      ( min_l      )
);

//hour��Χ��00~23
//ֻ�е�min��59��add_min_lΪ1'b1���Ż������λ
assign add_hour_l = ((min_h == 4'd5) && (min_l == 4'd9)) && add_min_l;      //ֻ����59���ӵ����һ�η��ӽ�λ�Ż����Сʱ��λ

hour u_hour(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .clear      ( clear      ),
    .add_hour_l  ( add_hour_l ),
    .hour_h      ( hr_h      ),
    .hour_l      ( hr_l      )
);


endmodule