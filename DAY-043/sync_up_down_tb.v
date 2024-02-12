`timescale 1ns / 1ps

module sync_up_down_tb;
 reg clk,rst,ctrl;
    wire [3:0]q;
    SYNC_UP_DOWN_COUNTER dut(clk,rst,ctrl,q);
    initial clk=0;
    always #5 clk=~clk;
    initial
    begin
    rst=1;
    #10 rst=0;ctrl=1;
    #170 ctrl =0;
    #170 $finish;
    
    end
    
endmodule
