`timescale 1ns / 1ps


module Exor_gate(
input a,b,
output y
  );
 mux m1(b,~b,a,y);
endmodule

module mux(
input a,b,
input sel,
output y
);
assign y = (a & ~sel)|(b & sel);

endmodule