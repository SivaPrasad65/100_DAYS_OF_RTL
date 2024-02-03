`timescale 1ns / 1ps

module SIPO(
input din,clk,rst,
output reg [3:0] q
    );
    reg [3:0] temp;
    always@(posedge clk)
    if(rst==1'b1)
    q<=4'b0000;
    else begin
    temp=q>>1;
    q={din,temp[2:0]};
    end
  
endmodule
