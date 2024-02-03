`timescale 1ns / 1ps

module sipo_tb;
reg  din,clk,rst;
wire [3:0] q;

SIPO dut(din,clk,rst,q);

initial begin
   clk=0;
    rst = 1;
    din=0;
    #10 rst = 0;
    
end
   
   always #1 clk=~clk;
   always #2 din=~din;
   initial #50 $stop;
  
endmodule



