`timescale 1ns / 1ps

module Decoder_3x8(
    output [7:0] y,
    input [2:0] i
    );

	 wire w1,w2,w3;
        assign w1= ~i[2];
        assign w2= ~i[1];
        assign w3= ~i[0];
        assign y[0]= w1&w2&w3;
        assign y[1]= w1&w2&i[0];
        assign y[2]= w1&i[1]&w3;
        assign y[3]= w1&i[1]&i[0];
        assign y[4]= i[2]&w2&w3;
        assign y[5]= i[2]&w2&i[0];
        assign y[6]= i[2]&i[1]&w3;
        assign y[7]= i[2]&i[1]&i[0];
endmodule
