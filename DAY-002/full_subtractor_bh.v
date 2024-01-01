`timescale 1ns / 1ps
module full_subtractor_bh(
input a,b,bin,
output reg diff,barrow);
always@(*)
begin
 diff <= bin^a^b;
 barrow <= (~a&b)+ ((~(a^b))& bin);
end
endmodule