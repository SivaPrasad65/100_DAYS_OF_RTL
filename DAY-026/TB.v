`timescale 1ns / 1ps


module TB;
reg d,clk;
wire q,qbar;

D_USING_SR dut(d,clk,q,qbar);
always #50 clk =~clk;
always #100 d=~d; 

initial begin
clk=0;
d=0;
#10;
$monitor("qb=%b qbar=%b  d=%b  clk=%b ",d,clk,q,qbar);
#500 $finish;
end

endmodule


