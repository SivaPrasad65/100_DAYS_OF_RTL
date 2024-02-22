`timescale 1ns / 1ps

module LFSR(
 output reg [3:0] out,
  input clk, rst
  );
  
  wire fb;

  assign fb = ~(out[3] ^ out[2]);

always @(posedge clk, posedge rst)
  begin
    if (rst)
      out = 4'b0;
    else
      out = {out[2:0],fb};
  end
endmodule