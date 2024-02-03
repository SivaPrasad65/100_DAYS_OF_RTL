`timescale 1ns / 1ps

module sipo_tb;
reg  din,clk,clr;
wire [3:0] q;

SIPO dut(din,clk,clr,q);

initial begin
   clk=0;
    clr = 1;
    din=0;
    #10 clr = 0;
    
end
   
   always #1 clk=~clk;
   always #2 din=~din;
   initial #50 $stop;
  
endmodule



