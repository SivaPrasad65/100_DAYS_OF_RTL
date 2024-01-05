`timescale 1ns / 1ps

module mux8x1_4x1mux(
input [7:0] i,
input [2:0] s,
output y
    );
    wire y0,y1;
    mux4x1 m1(i[3:0],s[1:0],y0);
    mux4x1 m2(i[7:4],s[1:0],y1);
    mux_2x1 m3(y0,y1,s[2],y);
endmodule

module mux4x1(
input [3:0] n,
input [1:0] s,
output y);
wire w1,w2;

assign w1=~s[1];
assign w2=~s[0];
assign y = (w1&w2& n[0])|(w1&s[0]&n[1])|(s[1]&w2&n[2])|(s[1]&s[0]&n[3]);

endmodule

module mux_2x1(
input m0,m1,
input s,
output y);
assign y = (~s & m0) | (s & m1);
endmodule