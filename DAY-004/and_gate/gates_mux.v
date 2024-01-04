`timescale 1ns / 1ps

module and_mux(
input a,b,
output y
  );
 mux m1(1'b0,b,a,y);
endmodule

module mux(
input a,b,
input sel,
output y
);
assign y = (a & ~sel)|(b & sel);

endmodule