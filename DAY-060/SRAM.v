`timescale 1ns / 1ps


module SRAM #(parameter addr_width = 6, data_width=8, depth=64)
( input clk,rst,wr,
 input [addr_width-1:0] addr,
 input [data_width-1:0] data,
 output reg [data_width-1:0] Rout
    );
  
  reg [data_width-1:0] mem [0:depth-1];
  always@(posedge clk)
  begin
  if(rst==0)
  Rout<=0;
  else if(wr==0) 
  begin
 mem[addr]<=data;
 end
  else begin
  Rout<=mem[addr];
  end
  end
endmodule
