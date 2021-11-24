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
	//��λ����
    #100 rst_n <= 1'b1;
	//����һ��clk��start_stop��ģ�ⰴ���ݶ���ʼ��ť
    #100 start_stop <= 1'b1;
    #10 start_stop <= 1'b0;
	//����1000 ������հ�ť���鿴�Ƿ����Ϊ0
    #1000 clear <= 1'b1;
    #10 clear <= 1'b0;
	//�����ݶ���ʼ��ť�����¿�ʼ��ʱ
    #100 start_stop <= 1'b1;
    #10 start_stop <= 1'b0;
	//����1000 �ݶ�
    #1000 start_stop <= 1'b1;
    #10 start_stop <= 1'b0;
	//����100����������Ƿ���ά�ֲ���
    #100;
	//�����ݶ�����ʼ��ʱ
    #10 start_stop <= 1'b1;
    #10 start_stop <= 1'b0;
	//����10000000���鿴������ʱ��λ�Ƿ��д�
    //#10000000 $stop;
end


endmodule