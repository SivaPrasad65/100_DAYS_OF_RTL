`timescale 1ns / 1ps

module SYNC_UP_DOWN_COUNTER(
input clk,rst,ctrl,
    output [3:0] q
    );
    wire [3:0]qd,qbar,qbard;
    wire w1,w2,w3;
   t_flipflop1 a1(1,clk,rst,q[0],qbar[0]);
   and a2(qd[0],q[0],~ctrl);
   and a3(qbard[0],qbar[0],ctrl);
   or a4(w1,qd[0],qbard[0]);
   t_flipflop1 a5(w1,clk,rst,q[1],qbar[1]);
   and a6(qd[1],q[1],qd[0]);
   and a7(qbard[1],qbar[1],qbard[0]);
   or a8(w2,qd[1],qbard[1]);
   t_flipflop1 a9(w2,clk,rst,q[2],qbar[2]);
   and a10(qd[2],q[2],qd[1]);
   and a11(qbard[2],qbar[2],qbard[1]);
   or a12(w3,qd[2],qbard[2]);
    t_flipflop1 a13(w3,clk,rst,q[3],qbar[3]);
endmodule
module t_flipflop1(
    input t,clk,rst,
    output reg q,qbar
    ); 
    always@(negedge clk)
    begin
    if(rst)
    begin
    q=0;qbar=1;
    end
    else begin
     q=(t&~q)|(~t&q);
     qbar=~q;
    end
    end
endmodule