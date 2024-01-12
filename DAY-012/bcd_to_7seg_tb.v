`timescale 1ns / 1ps


module bcd_to_7seg_tb;
reg [3:0] bcd;
wire [6:0] seg;
BCD_to_7seg dut(bcd,seg);
  initial begin
  bcd=4'b0000;
  #10 bcd=4'b0001;
  #10 bcd=4'b0010;
  #10 bcd=4'b0011;
  #10 bcd=4'b0100;
  #10 bcd=4'b0101;
  #10 bcd=4'b0110;
  #10 bcd=4'b0111;
 #10 $finish;
 end
endmodule
