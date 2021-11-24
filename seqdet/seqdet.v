module seqdet (
    input           clk,
    input           rst_n,
    input           din_vld,
    input           din,
    output      reg result
);

parameter       IDLE = 10'b00_0000_0001;
parameter       S1   = 10'b00_0000_0010;
parameter       S2   = 10'b00_0000_0100;
parameter       S3   = 10'b00_0000_1000;
parameter       S4   = 10'b00_0001_0000;
parameter       S5   = 10'b00_0010_0000;
parameter       S6   = 10'b00_0100_0000;
parameter       S7   = 10'b00_1000_0000;
parameter       S8   = 10'b01_0000_0000;
parameter       S9   = 10'b10_0000_0000;

reg [9:0]   current_state;
reg [9:0]   next_state;

always @ ( posedge clk or negedge rst_n )
begin
    if( ~rst_n == 1'b1 )
    begin
        current_state <= IDLE;
    end
    else
    begin
        current_state <= next_state;
    end
end

//组合逻辑 判断状态转移条件
always @ ( * )
begin
    if( ~rst_n == 1'b1 )
    begin
        next_state <= IDLE;
    end
    else
    begin 
    if( din_vld == 1'b1 )
        begin
            case( current_state )
            IDLE:
            begin
                if( din == 1'b1 )
                    next_state <= S1;
                else
                    next_state <= IDLE;
            end
            S1:
            begin
                if( din == 1'b1 )
                    next_state <= S6;
                else
                    next_state <= S2;
            end
            S2:
            begin
                if( din == 1'b1 )
                    next_state <= S3;
                else
                    next_state <= IDLE;
            end
            S3:
            begin
                if( din == 1'b1 )
                    next_state <= S4;
                else
                    next_state <= S2;
            end
            S4:
            begin
                if( din == 1'b1 )
                    next_state <= S5;
                else
                    next_state <= S2;
            end
            S5:
            begin
                if( din == 1'b0 )
                    next_state <= S8;
                else
                    next_state <= S7;
            end
            S6:
            begin
                if( din == 1'b1 )
                    next_state <= S7;
                else
                    next_state <= S2;
            end
            S7:
            begin
                if( din == 1'b0 )
                    next_state <= S8;
                else
                    next_state <= S7;
            end
            S8:
            begin
                if( din == 1'b0 )
                    next_state <= S9;
                else
                    next_state <= S3; 
            end
            S9:
            begin
                if( din == 1'b0 )
                    next_state <= IDLE;
                else
                    next_state <= S1;
            end
            default:
            begin
                next_state <= IDLE;
            end
            endcase
          end
       else
        ;
      end
end

//当从状态S5->S8和S9->IDLE，result置为1
always @ ( posedge clk )
begin
    if( ~rst_n == 1'b1 )
    begin
        result <= 1'b0;
    end
    else
    begin
        if(( current_state == S5 && next_state == S8 )||( current_state == S9 && next_state == IDLE ))
            result <= 1'b1;
        else
            result <= 1'b0;
    end
end

endmodule