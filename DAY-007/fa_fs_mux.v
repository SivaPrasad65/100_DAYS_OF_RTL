`timescale 1ns / 1ps

module fa_fs_mux(
  input a,b,cin,
  output s,ca,di,bo
    );
    wire c;
    mux2x1 a1(1,0,cin,c);
    mux_4x1 fa_s({cin,c,c,cin},{a,b},s);
    mux_4x1 fa_c({1'b1,cin,cin,1'b0},{a,b},ca);
    mux_4x1 fs_di({cin,c,c,cin},{a,b},di);
    mux_4x1 fs_bo({cin,0,1,cin},{a,b},bo);
    
endmodule

module mux_4x1(
input [3:0] n,
input [1:0] s,
output y);
wire w1,w2;

assign w1=~s[1];
assign w2=~s[0];
assign y = (w1&w2& n[0])|(w1&s[0]&n[1])|(s[1]&w2&n[2])|(s[1]&s[0]&n[3]);

endmodule

module mux2x1(
input y0,y1,
input s,
output y);
assign y = (~s & y0) | (s & y1);
endmodule