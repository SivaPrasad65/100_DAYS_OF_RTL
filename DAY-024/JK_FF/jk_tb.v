`timescale 1ns / 1ps

module jk_tb;
reg j,k,clk; 
wire q;
wire qb;
    
 jk_ff dut(j,k,clk,q,qb);
 initial begin
clk =1;
forever #50 clk=~clk;
end

initial begin
j=0;k=0;
#100;j=0;k=1;
#100;j=1;k=0;
#100;j=1;k=1;
end
initial begin
$monitor("j=%b k=%b clk=%b q=%b qb=%b",j,k,clk,q,qb);
#500 $finish;
end
endmodule


