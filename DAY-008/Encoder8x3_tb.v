`timescale 1ns / 1ps

module Encoder8x3_tb;
reg [7:0] i;
wire [2:0] b ;

 Encoder_8x3 dut(i,b);
 initial begin
 i=8'hfa;
 #100 i =8'hac;
 #100 i =8'h1b;
 #100 i =8'h03;
 #100 i =8'h26;
 #100 $finish();

 end
endmodule
