`timescale 1ns / 1ps

module LIFO_TB;
reg clk, rstn, pop, push;
  reg [7:0] data_in;
  wire [7:0] data_out;
  wire is_empty, is_full;

  LIFO uut (clk,rstn,pop,push,data_in,data_out,is_empty,is_full);

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rstn = 0;
    pop = 0;
    push = 0;
    data_in = 8'h00;
    #10 rstn = 1;
    #5 push = 1;
    data_in = 8'h0a; 
    #5 push = 0;
    #5 pop = 1;
    #5 pop = 0;
    #50 $finish;
  end
endmodule
