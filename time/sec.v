module sec(
    input   clk,
    input   rst_n,
    input   clear,
    input   start_stop,

    output  reg [3:0]   sec_h,
    output  reg [3:0]   sec_l
);

//ÿ�ΰ����ݶ���ʼ��ť���Ͷ�start_flag��1,ʹ�䷴ת
//��clearʹ��ʱ��������еļĴ���
reg         start_flag;
always @( posedge clk or negedge rst_n) begin
    if(~rst_n == 1'b1)begin
        start_flag <= 1'b0;
    end
    else begin
        if(clear == 1'b0)begin
            if(start_stop == 1'b1)
                start_flag <= start_flag + 1'b1;
            else
                ;            
        end
        else begin
            start_flag <= 1'b0;
        end
    end 
end

//��clearΪ1'b0����start_flag��1'b1����ʼ����
always @( posedge clk or negedge rst_n) begin
    if(~rst_n == 1'b1)begin
        sec_l <= 4'b0;
        sec_h <= 4'b0;
    end
    else begin
        if(clear == 1'b0)begin
            if(start_flag==1'b1)begin
                if(sec_l < 4'd9)begin
                    sec_l <= sec_l + 1'b1;
                end
                else begin
                    sec_l <= 4'b0;
                    if(sec_h < 4'd5)begin
                        sec_h <= sec_h + 1'b1;
                    end
                    else begin
                        sec_h <= 4'b0;
                    end
                        end
                    end
            else    //��ͣ��ʲôҲ����
                ;
        end
        else begin
            sec_l <= 4'b0;
            sec_h <= 4'b0;
        end
    end
end

endmodule