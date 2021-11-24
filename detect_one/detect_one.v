module detect_one
(
    input       [31:0]  data_in,
    output      [5:0]   pos_out
);

wire [4:0]  temp;
wire [15:0] data_16;
wire [7:0]  data_8;
wire [3:0]  data_4;
wire [1:0]  data_2;

assign pos_out[5] = data_in == 32'b00000000_00000000_00000000_00000000 ? 1'b1 : 1'b0;

assign temp[4] = | data_in[31:16];
assign data_16 = temp[4] == 1'b1 ? data_in[31:16] : data_in[15:0];

assign temp[3] = | data_16[15:8];
assign data_8 = temp[3] == 1'b1 ? data_16[15:8] : data_16[7:0];

assign temp[2] = | data_8[7:4];
assign data_4 = temp[2] == 1'b1 ? data_8[7:4] : data_8[3:0];

assign temp[1] = | data_4[3:2];
assign data_2 = temp[1] == 1'b1 ? data_4[3:2] : data_4[1:0];

assign temp[0] = data_2[1];

assign pos_out[4:0] = data_in == 32'b00000000_00000000_00000000_00000000 ?  5'b00000: ~temp;

endmodule