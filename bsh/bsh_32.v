module bsh_32(
    input   [31:0]   data_in,
    input            dir,
    input   [4:0]    sh,

    output [31:0]   data_out
);

 assign   data_out =  dir == 1'b1 ? (( data_in >> sh )|( data_in << ( 32 - sh ))) : (( data_in << sh) | ( data_in >> (32 - sh )));

//0 ×óÒÆ
//1 ÓÒÒÆ
//always @(*)begin
//    case(sh)
//    5'd0:
//    data_out = data_in;
//    5'd1:
//    data_out = dir == 1'b0 ? {data_in[0+:31], data_in[31-:1]} : {data_in[0+:1], data_in[31-:31]};
//    5'd2:
//    data_out = dir == 1'b0 ? {data_in[0+:30], data_in[31-:2]} : {data_in[0+:2], data_in[31-:30]};
//    5'd3:
//    data_out = dir == 1'b0 ? {data_in[0+:29], data_in[31-:3]} : {data_in[0+:3], data_in[31-:29]};
//    5'd4:
//    data_out = dir == 1'b0 ? {data_in[0+:28], data_in[31-:4]} : {data_in[0+:4], data_in[31-:28]};
//    5'd5:
//    data_out = dir == 1'b0 ? {data_in[0+:27], data_in[31-:5]} : {data_in[0+:5], data_in[31-:27]};
//    5'd6:
//    data_out = dir == 1'b0 ? {data_in[0+:26], data_in[31-:6]} : {data_in[0+:6], data_in[31-:26]};
//    5'd7:
//    data_out = dir == 1'b0 ? {data_in[0+:25], data_in[31-:7]} : {data_in[0+:7], data_in[31-:25]};
//    5'd8:
//    data_out = dir == 1'b0 ? {data_in[0+:24], data_in[31-:8]} : {data_in[0+:8], data_in[31-:24]};
//    5'd9:
//    data_out = dir == 1'b0 ? {data_in[0+:23], data_in[31-:9]} : {data_in[0+:9], data_in[31-:23]};
//    5'd10:
//    data_out = dir == 1'b0 ? {data_in[0+:22], data_in[31-:10]} : {data_in[0+:10], data_in[31-:22]};
//    5'd11:
//    data_out = dir == 1'b0 ? {data_in[0+:21], data_in[31-:11]} : {data_in[0+:11], data_in[31-:21]};
//    5'd12:
//    data_out = dir == 1'b0 ? {data_in[0+:20], data_in[31-:12]} : {data_in[0+:12], data_in[31-:20]};
//    5'd13:
//    data_out = dir == 1'b0 ? {data_in[0+:19], data_in[31-:13]} : {data_in[0+:13], data_in[31-:19]};
//    5'd14:
//    data_out = dir == 1'b0 ? {data_in[0+:18], data_in[31-:14]} : {data_in[0+:14], data_in[31-:18]};
//    5'd15:
//    data_out = dir == 1'b0 ? {data_in[0+:17], data_in[31-:15]} : {data_in[0+:15], data_in[31-:17]};
//    5'd16:
//    data_out = dir == 1'b0 ? {data_in[0+:16], data_in[31-:16]} : {data_in[0+:16], data_in[31-:16]};
//    5'd17:
//    data_out = dir == 1'b0 ? {data_in[0+:15], data_in[31-:17]} : {data_in[0+:17], data_in[31-:15]};
//    5'd18:
//    data_out = dir == 1'b0 ? {data_in[0+:14], data_in[31-:18]} : {data_in[0+:18], data_in[31-:14]};
//    5'd19:
//    data_out = dir == 1'b0 ? {data_in[0+:13], data_in[31-:19]} : {data_in[0+:19], data_in[31-:13]};
//    5'd20:
//    data_out = dir == 1'b0 ? {data_in[0+:12], data_in[31-:20]} : {data_in[0+:20], data_in[31-:12]};
//    5'd21:
//    data_out = dir == 1'b0 ? {data_in[0+:11], data_in[31-:21]} : {data_in[0+:21], data_in[31-:11]};
//    5'd22:
//    data_out = dir == 1'b0 ? {data_in[0+:10], data_in[31-:22]} : {data_in[0+:22], data_in[31-:10]};
//    5'd23:
//    data_out = dir == 1'b0 ? {data_in[0+:9], data_in[31-:23]} : {data_in[0+:23], data_in[31-:9]};
//    5'd24:
//    data_out = dir == 1'b0 ? {data_in[0+:8], data_in[31-:24]} : {data_in[0+:24], data_in[31-:8]};
//    5'd25:
//    data_out = dir == 1'b0 ? {data_in[0+:7], data_in[31-:25]} : {data_in[0+:25], data_in[31-:7]};
//    5'd26:
//    data_out = dir == 1'b0 ? {data_in[0+:6], data_in[31-:26]} : {data_in[0+:26], data_in[31-:6]};
//    5'd27:
//    data_out = dir == 1'b0 ? {data_in[0+:5], data_in[31-:27]} : {data_in[0+:27], data_in[31-:5]};
//    5'd28:
//    data_out = dir == 1'b0 ? {data_in[0+:4], data_in[31-:28]} : {data_in[0+:28], data_in[31-:4]};
//    5'd29:
//    data_out = dir == 1'b0 ? {data_in[0+:3], data_in[31-:29]} : {data_in[0+:29], data_in[31-:3]};
//    5'd30:
//    data_out = dir == 1'b0 ? {data_in[0+:2], data_in[31-:30]} : {data_in[0+:30], data_in[31-:2]};
//    5'd31:
//    data_out = dir == 1'b0 ? {data_in[0+:1], data_in[31-:31]} : {data_in[0+:31], data_in[31-:1]};
//    endcase
//end
 
endmodule