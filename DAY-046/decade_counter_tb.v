`timescale 1ns / 1ps

module decade_counter_tb;
reg clk = 0, rst = 1;
reg [1:0]J,K;
wire [3:0]Q;

Decade_counter DCD(clk,rst,J,K,Q);

  initial begin
  J = 2'b11; K = 2'b11; #2000;
  end
  initial repeat(200) #10 clk=~clk;
  initial #70 rst = 0;

endmodule