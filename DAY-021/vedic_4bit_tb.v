`timescale 1ns / 1ps

module vedic_4bit_tb;
reg [3:0] a;
reg [3:0] b;
wire [7:0] p;

vedic_multiplier dut(a,b,p);
  initial begin
  $monitor("a=%b,b=%b p=%b ",a,b,p);
  #1000 $finish;
  end
  always begin
  a=$random;
  b=$random;
  #50;
  
  end
  
endmodule