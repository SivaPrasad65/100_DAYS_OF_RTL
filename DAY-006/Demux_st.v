`timescale 1ns / 1ps

module Demux_st(
input a,
input [2:0] s,
output [7:0] y
    );
    wire w1,w2,w3;
    not n1(s[0],w1);
    not n2(s[1],w2);
    not n3(s[2],w3);
    and a1(y[0],w3,w2,w1,a);
    and a2(y[1],w3,w2,s[0],a);
    and a3(y[2],w3,s[1],w1,a);
    and a4(y[3],w3,s[1],s[0],a);
    and a5(y[4],s[2],w2,w1,a);
    and a6(y[5],s[2],w2,w1,a);
    and a7(y[6],s[2],s[1],w1,a);
    and a8(y[7],s[2],s[1],s[0],a);
endmodule
