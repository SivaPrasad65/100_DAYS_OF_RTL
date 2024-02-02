`timescale 1ns / 1ps
module siso_tb;

  reg clk, rst, din;
  wire q;

  siso uut(
    .clk(clk),
    .rst(rst),
    .din(din),
    .q(q)
  );

  initial begin
   clk=0;
    rst = 1;
    din=0;
    #10 rst = 0;
    
end
    // Apply test cases
   always #1 clk=~clk;
   always #2 din=~din;
   initial #100 $stop;
  
endmodule
