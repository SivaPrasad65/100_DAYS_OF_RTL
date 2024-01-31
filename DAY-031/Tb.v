`timescale 1ns / 1ps


module Tb;
reg  s,r,clk,rst;
wire q_jk,q_d,q_t;

SR_USING_JK_T_D dut(s,r,clk,rst,q_jk,q_d,q_t);
initial begin
clk=0;
forever #5 clk =~clk;
end

initial begin
rst=1;
s=0;
r=0;
#10 
rst=0;
end
always begin
s=0;
r=0;
#10;
s=0;
r=1;
#10; 
s=1;
r=0;
#10; 
s=1;
r=1;
#10;
end
initial begin
#90 $finish();
end
endmodule
