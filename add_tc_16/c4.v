//4位超前进位
module c4(
    input   [3:0]   p,      //接收4个1位全加器的传播信号
    input   [3:0]   g,      //接收4个1位全加器的生成信号
    input           c_in,   //接收进位信号

    output  [4:1]   ci,     //输出4个超前进位信号
    output  gm,             //4位超前进位器的生成信号
    output  pm              //4位超前进位器的传播信号
);

assign ci[1] = g[0] | p[0] & c_in;
assign ci[2] = g[1] | p[1] & g[0] | p[1] & p[0] & c_in;
assign ci[3] = g[2] | p[2] & g[1] | p[2] & p[1] & g[0] | p[2] & p[1] & p[0] & c_in;
assign ci[4] = g[3] | p[3] & g[2] | p[3] & p[2] & g[1] | p[3] & p[2] & p[1] & g[0] | p[3] & p[2] & p[1] & p[0] & c_in;

assign gm = g[3] | p[3] & g[2] | p[3] & p[2] & g[1] | p[3] & p[2] & p[1] & g[0];
assign pm = &p;

endmodule
