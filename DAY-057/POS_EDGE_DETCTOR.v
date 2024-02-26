`timescale 1ns / 1ps

module POS_EDGE_DETCTOR(
input din,clk,
output det);
reg signal;
always@(posedge clk)
begin
signal<=din;
end
assign det = din & (~signal);
endmodule
