`timescale 1ns / 1ps

module fir_filter_tb;
reg clk;
  reg rst;
  reg [7:0] x;
  wire [7:0] y;

  Fir_filter dut(
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y)
  );
  initial $monitor("clk=%b  rst=%b x=%b y=%b",clk,rst,x,y);
  initial begin
    clk = 1;
    rst = 1;
    x = 0;
    #10 rst = 0;
    #10 x = 1;
    #10 x = 2;
    #10 x = 3;
    #10 x = 4;
    #10 x = 5;
    #10 x = 6;
    #10 x = 7;
    #10 x = 8;
    #10 $finish;
  end

  always #5 clk = ~clk;

endmodule
