`timescale 1ns / 1ps

module Bcd_to_Dec(
input [3:0] a,
output [9:0] y
    );
    wire w0,w1,w2,w3;
    not a0(w0,a[0]);
    not a1(w1,a[1]);
    not a2(w2,a[2]);
    not a3(w3,a[3]);
    
    and n1(y[0],w0,w1,w2,w3);
    and n2(y[1],a[0],w1,w2,w3);
    and n3(y[2],w0,a[1],w2,w3);
    and n4(y[3],a[1],a[0],w2,w3);
    and n5(y[4],w0,w1,a[2],w3);
    and n6(y[5],a[0],w1,a[2],w3);
    and n7(y[6],a[2],a[1],w0,w3);
    and n8(y[7],a[0],a[1],a[2],w3);
    and n9(y[8],w0,w1,w2,a[3]);
    and n10(y[9],a[0],w1,a[3],w2);
    
endmodule
