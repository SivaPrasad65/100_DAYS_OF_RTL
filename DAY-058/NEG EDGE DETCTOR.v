`timescale 1ns / 1ps

module NEG_EDGE_DETCTOR(
input din,clk,
output det
    );
    reg temp;
   always@(posedge clk)
   begin
    temp<=din;
   end 
    assign det = ~din & temp;
endmodule
