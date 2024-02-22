`timescale 1ns / 1ps

module lfsr_tb;
wire [3:0] out;
  reg clk, rst;
  LFSR uut(out,clk,rst);
  
  initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
    $monitor("out=%b clk=%b rst=%b",out,clk,rst);
    #100 $finish;
  end
  always #5 clk = ~clk;
endmodule