`timescale 1ns / 1ps


module siso(
input din,clk,rst,
output q
    );
   reg [3:0] shift_reg ;
   always@(posedge clk)
   begin
   if(rst)
   shift_reg<=4'b0000;
   else begin
   shift_reg<=shift_reg>>1;
   shift_reg[3]<=din;
   end
   end 
    assign q=shift_reg[0];
   
endmodule
