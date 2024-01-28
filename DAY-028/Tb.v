`timescale 1ns / 1ps


module Tb;
reg j,k,clk;
wire q,qbar;

JK_using_SR dut(j,k,clk,q,qbar);
initial begin
        clk = 0;
        j=0;
        k=0;
        $monitor("q=%b qbar=%b j=%b k=%b clk=%b",q,qbar,j,k,clk);
        #500 $finish;
    end
    always #50 clk = ~clk;
    always #100 k = ~k;
    always #200 j = ~j;
endmodule