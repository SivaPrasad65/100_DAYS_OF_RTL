`timescale 1ns / 1ps

module PIPO(
input [3:0] din,
input clk,clr,
output reg [3:0] q
    );
    
    always@(posedge clk)
    begin
    if(clr==1'b1)
    q<=4'b0000;
    else begin
     q<=din;
    end
    end
   
endmodule
