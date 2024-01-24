`timescale 1ns / 1ps

module t_tb;
reg t,clk;
wire q;
wire qb;

T_ff dut(t,clk,q,qb);
initial begin
clk=0;
forever #2 clk=~clk;
end
 initial begin
 t=0;
 #5;
 t=1;
 #5;
 t=0;
 #5;
 t=1;
 #5;
 $finish();
 end
endmodule
