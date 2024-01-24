`timescale 1ns / 1ps

module T_ff(
input t,clk,
output reg q,
output qb
    ); 
    always@(posedge clk)
 begin
q<=(~t);
 end
 assign qb = ~q;
endmodule

