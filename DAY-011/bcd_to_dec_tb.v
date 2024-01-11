`timescale 1ns / 1ps


module bcd_to_dec_tb;
reg [3:0] a;
wire [9:0] y;
  Bcd_to_Dec dut(a,y);  
  initial begin
  a=4'b0000;
  #10 a=4'b0001;
  #10 a=4'b0010;
  #10 a=4'b0011;
  #10 a=4'b0100;
  #10 a=4'b0101;
  #10 a=4'b0110;
  #10 a=4'b0111;
  #10 a=4'b1000;
  #10 a=4'b1001;
 #10 $finish;
  end
endmodule
