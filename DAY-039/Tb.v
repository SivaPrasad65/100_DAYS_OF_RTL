`timescale 1ns / 1ps

module Tb;
reg clk,rst;
    wire [3:0]q;
    Async_up_counter dut(clk,rst,q);
    initial clk=0;
    always #5 clk=~clk;
    initial
    begin
    rst=1;
    #20 rst=0; 
    end
endmodule
