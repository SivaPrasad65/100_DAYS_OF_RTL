`timescale 1ns / 1ps

module Encoder_8x3(
input [7:0] i,
output [2:0] b 
    );
   assign b[0] = i[1] | i[3] | i[5] | i[7];
   assign b[1] = i[2] | i[3] | i[6] | i[7];
   assign b[2] = i[4] | i[5] | i[6] | i[7];
 
endmodule
