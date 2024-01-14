`timescale 1ns / 1ps

module Ripple_carry_adder(
input [3:0] a,b,
input cin,
output [3:0] s,
output cout );
wire [2:0] ca;

fa f1(a[0],b[0],cin,s[0],ca[0]);
fa f2(a[1],b[1],ca[0],s[1],ca[1]);
fa f3(a[2],b[2],ca[1],s[2],ca[2]);
fa f4(a[3],b[3],ca[2],s[3],cout);

endmodule

module fa(
input a,b,c,
output s,cout);
assign s=a^b^c;
assign cout =(a&b)|(b&c)|(c&a);
endmodule