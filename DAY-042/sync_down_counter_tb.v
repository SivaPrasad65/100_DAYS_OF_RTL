`timescale 1ns / 1ps

module sync_down_counter;
reg clk,rst;
    wire [3:0]q;
    SYNC_DOWN_COUNTER dut(clk,rst,q);
    initial clk=0;
    always #5 clk=~clk;
    initial
    begin
    rst=1;
    #10 rst=0;
    #200 $finish;
    end
endmodule
