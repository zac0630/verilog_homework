module min(
    input   clk,
    input   rst_n,
    input   clear,
    input   add_min_l,

    output  reg [3:0]   min_h,
    output  reg [3:0]   min_l
);


always @( posedge clk or negedge rst_n) begin
    if(~rst_n == 1'b1)begin
        min_l <= 4'b0;
        min_h <= 4'b0;
    end
    else begin
        if(clear == 1'b0)begin
            if(add_min_l==1'b1)begin
                if(min_l < 4'd9)begin       //��֤min_l�ķ�Χ��0~9
                    min_l <= min_l + 1'b1;
                end
                else begin                  //��min_lΪ9ʱ��������λ��min_h+1
                    min_l <= 4'b0;
                    if(min_h < 4'd5)begin
                        min_h <= min_h + 1'b1;
                    end
                    else begin
                        min_h <= 4'b0;
                    end
                        end
                    end
            else
                ;
        end
        else begin
            min_l <= 4'b0;
            min_h <= 4'b0;
        end
    end
end

endmodule