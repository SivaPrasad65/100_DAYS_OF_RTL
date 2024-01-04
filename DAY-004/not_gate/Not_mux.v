`timescale 1ns / 1ps

 
module Not_mux(
input a,
output y
    );
    mux m1(1,0,a,y);
endmodule

module mux(
input a,b,sel,
output y);
assign y = (a & ~sel)|(b & sel);
endmodule