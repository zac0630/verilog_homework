module bsh_32_tb();

reg     [31:0]  data_in;
reg             dir;
reg     [4:0]   sh;

wire    [31:0]  data_out;

bsh_32 u_bsh_32(
    .data_in ( data_in ),
    .dir     ( dir     ),
    .sh      ( sh      ),
    .data_out  ( data_out  )
);

initial begin
#100 data_in <= 32'b00011000101000000000000000000000; dir <= 1'b0; sh <= 5'd10;

#100 data_in <= 32'b00000000111111110000000000000011; dir <= 1'b1; sh <= 5'd20;
end

endmodule