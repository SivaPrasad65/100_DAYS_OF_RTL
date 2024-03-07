`timescale 1ns / 1ps

module Booth_multiplier_tb;
reg signed [3:0] multiplicand;
  reg signed [3:0] multiplier;
  wire signed [7:0] product;
  
  BOOTHS_MULTIPLIER dut (multiplicand, multiplier, product);

  initial begin
    $monitor("multiplicand = %d, multiplier = %d, product = %d", multiplicand, multiplier, product);
    multiplicand = 4'b0011;
    multiplier = 4'b0001;
    #10;
    multiplicand = 4'b1010;
    multiplier = 4'b0111;
    #10;
    multiplicand = 4'b1110;
    multiplier = 4'b1011;
    #10;
    multiplicand = 4'b1011;
    multiplier = 4'b1011;
    #10;
    $finish;
  end
endmodule

