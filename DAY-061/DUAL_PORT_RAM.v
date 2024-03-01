`timescale 1ns / 1ps

module DUAL_PORT_RAM(
input [7:0] data_1, data_2,
  input [5:0] addr_1, addr_2, 
  input wen_1, wen_2, 
  input clk, 
  output reg [7:0] q_1, q_2
);
  
  reg [7:0] ram [63:0]; 
 
  always @ (posedge clk)
    begin
      if(wen_1)
        ram[addr_1] <= data_1;
      else
        q_1 <= ram[addr_1]; 
    end
  
  always @ (posedge clk)
    begin
      if(wen_2)
        ram[addr_2] <= data_2;
      else
        q_2 <= ram[addr_2]; 
    end
  
endmodule
