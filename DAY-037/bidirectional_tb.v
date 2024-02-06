`timescale 1ns / 1ps

module bidirectional_tb;
  reg clk, rst, enable, mode, din;
  wire [3:0] q;
  
  BIDIRECTIONAL_SHIFT_REGISTER dut(clk,rst,enable,mode,din,q);
  always #5 clk=~clk;
  initial begin
        clk = 0;
        rst = 1;
        enable = 0;
        mode = 0;
        din = 0;
        #10 rst = 0; 
        #10 enable = 1; 
        #80 $stop; 
    end

    
    always #25 din = ~din; 
    always  #55 mode = ~mode; 
   
 
endmodule
