`timescale 1ns / 1ps


module sr_tb;
reg  s,r;
reg clk;
wire q,qbar;

SR_FF dut(s,r,clk,q,qbar);
initial begin
clk =0;
forever #50 clk=~clk;
end

initial begin
s=0;r=0;
#100;s=0;r=1;
#100;s=1;r=0;
#100; s=1;r=1;
end
initial begin
$monitor("s=%b r=%b clk=%b q=%b qbar=%b",s,r,clk,q,qbar);
#400 $finish;
end
endmodule