`timescale 1ns / 1ps


module TB;
reg j,k,clk,rst;
wire  q;

JK_using_T dut(j,k,clk,rst,q);
initial
    begin
        j = 0;
        k = 0;
        rst = 1;
        clk = 0;
        #50 rst = 0;
        $monitor("j=%b k=%b  clk=%b rst=%b q=%b",j, k, clk,rst,q);
        #350 $finish;
    end
    always #100 j = ~j;
    always #200 k = ~k;
    always #45 clk = ~clk;
endmodule