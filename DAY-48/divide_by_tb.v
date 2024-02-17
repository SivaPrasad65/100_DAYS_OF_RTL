`timescale 1ns / 1ps

module divide_by_tb;
reg clk,reset;
    wire q;
    
    Divide_by dut(clk,reset,q);
    initial
    begin
        $monitor("clk=%d reset =%d q=%d",clk,reset,q);
        clk = 0;
        reset = 1;
        #20 reset = 0;
        #100 $finish;
    end
    
    always #5 clk = ~clk;
endmodule