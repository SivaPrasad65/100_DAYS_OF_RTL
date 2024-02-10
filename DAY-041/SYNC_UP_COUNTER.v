`timescale 1ns / 1ps

module SYNC_UP_COUNTER(
input clk,rst,
    output [3:0] q
    );
    wire w1,w2;
    t_flipflop1 a1(1,clk,rst,q[0]);
    t_flipflop1 a2(q[0],clk,rst,q[1]);
    and a3(w1,q[0],q[1]);
    t_flipflop1 a4(w1,clk,rst,q[2]);
     and a5(w2,q[2],w1);
     t_flipflop1 a6(w2,clk,rst,q[3]);
endmodule
module t_flipflop1(
    input t,clk,rst,
    output reg q
    ); 
    always@(negedge clk)
    begin
    if(rst)
    begin
    q=0;
    end
    else begin
     q=(t&~q)|(~t&q);
     
    end
    end
endmodule