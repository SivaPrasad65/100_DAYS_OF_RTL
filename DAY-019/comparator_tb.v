`timescale 1ns / 1ps

module comparator_tb;
reg [3:0]a,b;
wire equal,grt,lst;

comparator_4bit dut(a,b,equal,grt,lst);
  initial
  begin
  a= 3;
  b= 5;
  #10;
   
  a=5;
  b=3;
  #10;
   
  a=5;
  b=5;
  #10;
    
   $finish;
  end
  
endmodule