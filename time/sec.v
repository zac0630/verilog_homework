module sec(
    input   clk,
    input   rst_n,
    input   clear,
    input   start_stop,

    output  reg [3:0]   sec_h,
    output  reg [3:0]   sec_l
);

//每次按下暂定开始按钮，就对start_flag加1,使其反转
//当clear使能时，清空所有的寄存器
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

//当clear为1'b0，且start_flag是1'b1，开始计数
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
            else    //暂停，什么也不做
                ;
        end
        else begin
            sec_l <= 4'b0;
            sec_h <= 4'b0;
        end
    end
end

endmodule