`timescale 1ns / 1ps

module PIPO_TB;
reg [3:0] din;
reg clk,clr;
wire[3:0] q;

PIPO dut(din,clk,clr,q);
initial begin
clk=0;
clr=1'b1;
din=1010;
#5 clr = 0;
#3 din=4'b1011;
#3 din = 4'b1001;
#3 din = 4'b0101;
end
   
   always #1 clk=~clk;
   initial #20 $stop;
   endmodule