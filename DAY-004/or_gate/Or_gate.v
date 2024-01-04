`timescale 1ns / 1ps


module Or_gate(
input a,b,
output y);
mux m1(b,1,a,y);    
endmodule

module mux(
input a,b,
input sel,
output y
);
assign y = (a & ~sel)|(b & sel);

endmodule