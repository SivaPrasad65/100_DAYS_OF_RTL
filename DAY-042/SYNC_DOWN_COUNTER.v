`timescale 1ns / 1ps

module SYNC_DOWN_COUNTER(
input clk,rst,
    output [3:0] q
    );
    wire w1,w2;
    wire [3:0]qbar;
    t_flipflop1 a1(1,clk,rst,q[0],qbar[0]);
    t_flipflop1 a2(qbar[0],clk,rst,q[1],qbar[1]);
    and a4(w1,qbar[0],qbar[1]);
    t_flipflop1 a3(w1,clk,rst,q[2],qbar[2]);
    and a5(w2,w1,qbar[2]);
    t_flipflop1 a6(w2,clk,rst,q[3],qbar[3]);
endmodule
module t_flipflop1(
    input t,clk,rst,
    output reg q,qbar
    ); 
    always@(negedge clk)
    begin
    if(rst)
    begin
    q=0;qbar=~q;
    end
    else begin
     q=(t&~q)|(~t&q);
     qbar=~q;
     
    end
    end
endmodule
