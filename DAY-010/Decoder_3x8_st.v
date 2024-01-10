`timescale 1ns / 1ps

module Decoder_3x8_st(
    output [7:0] y,
    input [2:0] i
    );
    wire w1,w2,w3;
    not n1(w1,i[2]), 
        n2(w2,i[1]), 
		n3(w3,i[0]);
    and a1(y[0],w1,w2,w3),
        a2(y[1],w1,w2,i[0]),
        a3(y[2],w1,i[1],w3),
        a4(y[3],w1,i[1],i[0]),
        a5(y[4],i[2],w2,w3),
        a6(y[5],i[2],w2,i[0]),
        a7(y[6],i[2],i[1],w3),
        a8(y[7],i[2],i[1],i[0]);
endmodule