`timescale 1ns / 1ps


module CRC_PARALLEL_tb;
reg clk, rst, load, d_finish;
  reg [7:0] crc_in;
  wire [7:0] crc_out;

  CRC_PARALLEL crc_inst (clk,rst,load,d_finish,crc_in,crc_out);

  initial begin
    clk = 0;
    rst = 1; 
    load = 0;
    d_finish = 0;
    crc_in = 8'b00000000;
    #10 rst = 0;
    #10 load = 1;
    #10 crc_in = 8'b11011001;
    #10 crc_in = 8'b10101100;
    #10 crc_in = 8'b11110000;
    #10 load = 0;
    #100 d_finish = 1;
    #10 d_finish = 0;
    #10 load = 1;
    #10 crc_in = 8'b01010101;
    #10 crc_in = 8'b10101010;
    #10 load = 0;
    #100 d_finish = 1;
    #10 d_finish = 0;
    #1000 $finish;
  end
    always #5 clk = ~clk;
endmodule
