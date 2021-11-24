module hour(
    input   clk,
    input   rst_n,
    input   clear,
    input   add_hour_l,

    output  reg [3:0]   hour_h,
    output  reg [3:0]   hour_l
);


always @( posedge clk or negedge rst_n) begin
    if(~rst_n == 1'b1)begin
        hour_l <= 4'b0;
        hour_h <= 4'b0;
    end
    else begin
        if(clear == 1'b0)begin
            if(add_hour_l==1'b1)begin
                if(hour_h < 4'd2)begin //00 01 ... 09 10 11 ...19 将hour的范围分为00~19 和 20~23
                    if(hour_l < 4'd9)
                        hour_l <= hour_l + 1'b1;
                    else begin
                        hour_l <= 4'd0;
                        hour_h <= hour_h + 1'b1;
                    end
                end
                else begin      //20 21 22 23
                    if(hour_l < 4'd3)
                        hour_l <= hour_l + 1'b1;
                     else begin
                        hour_l <= 4'd0;
                        hour_h <= 4'd0;
                     end
                end
                    end
            else
                ;
        end
        else begin
            hour_l <= 4'b0;
            hour_h <= 4'b0;
        end
    end
end

endmodule