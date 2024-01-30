`timescale 1ns / 1ps

module TB;
reg j,k,clk;
wire q,qbar;

JK_USING_D dut(j,k,clk,q,qbar);
initial begin
        clk = 0;
        j=0;
        k=0;
        $monitor(" j=%b k=%b clk=%b q=%b qbar=%b",j,k,clk,q,qbar);
        #20 $finish;
    end
    always #1 clk = ~clk;
    always #3 k = ~k;
    always #6 j = ~j;
endmodule