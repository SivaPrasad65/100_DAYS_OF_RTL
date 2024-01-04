module Nor_gate(
input a,b,
output y
  );
 mux m1(~b,0,a,y);
endmodule

module mux(
input a,b,
input sel,
output y
);
assign y = (a & ~sel)|(b & sel);

endmodule