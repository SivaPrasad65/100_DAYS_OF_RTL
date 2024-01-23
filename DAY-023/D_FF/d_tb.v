`timescale 1ns / 1ps

module d_tb;
reg d,clk;
wire q,qbar ;

D_FF dut(d,clk,q,qbar);
initial begin
clk =0;
d=0;
end

always #50 clk=~clk;

initial begin
forever #100 d=~d;
end

endmodule
