`timescale 1ns / 1ps

module tb;
wire q_t,q_tb;
reg d,clk,reset;

D_USING_JK dut(q_t,q_tb,d,clk,reset);


always #50 clk =~clk;
always #100 d=~d; 

initial begin
clk=0;
d=0;
reset=1;
#10;
reset=0;
$monitor("q_t=%b q_tb=%b  d=%b  clk=%b reset=%b",q_t,q_tb,d,clk,reset);
#500 $finish;
end

endmodule
