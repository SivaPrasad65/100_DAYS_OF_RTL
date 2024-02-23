`timescale 1ns / 1ps

module Barrel_shifter(
input [7:0] in,
    input [2:0] shift_mag,
    output [7:0] out
    );
    wire [7:0] o1, o2; 

    mux_2x1 m0 (in[0], in[1], o1[0], shift_mag[0]);
    mux_2x1 m1 (in[1], in[2], o1[1], shift_mag[0]);
    mux_2x1 m2 (in[2], in[3], o1[2], shift_mag[0]);
    mux_2x1 m3 (in[3], in[4], o1[3], shift_mag[0]);
    mux_2x1 m4 (in[4], in[5], o1[4], shift_mag[0]);
    mux_2x1 m5 (in[5], in[6], o1[5], shift_mag[0]);
    mux_2x1 m6 (in[6], in[7], o1[6], shift_mag[0]);
    mux_2x1 m7 (in[7], in[0], o1[7], shift_mag[0]);
    
    mux_2x1 m8 (o1[0], o1[2], o2[0], shift_mag[1]);
    mux_2x1 m9 (o1[1], o1[3], o2[1], shift_mag[1]);
    mux_2x1 m10 (o1[2], o1[4], o2[2], shift_mag[1]);
    mux_2x1 m11 (o1[3], o1[5], o2[3], shift_mag[1]);
    mux_2x1 m12 (o1[4], o1[6], o2[4], shift_mag[1]);
    mux_2x1 m13 (o1[5], o1[7], o2[5],shift_mag[1]);
    mux_2x1 m14 (o1[6], o1[0], o2[6], shift_mag[1]);
    mux_2x1 m15 (o1[7], o1[1], o2[7], shift_mag[1]);
  
    mux_2x1 m16 (o2[0], o2[4], out[0], shift_mag[2]);
    mux_2x1 m17 (o2[1], o2[5], out[1], shift_mag[2]);
    mux_2x1 m18 (o2[2], o2[6], out[2], shift_mag[2]);
    mux_2x1 m19 (o2[3], o2[7], out[3], shift_mag[2]);
    mux_2x1 m20 (o2[4], o2[0], out[4], shift_mag[2]);
    mux_2x1 m21 (o2[5], o2[1], out[5], shift_mag[2]);
    mux_2x1 m22 (o2[6], o2[2], out[6], shift_mag[2]);
    mux_2x1 m23 (o2[7], o2[3], out[7], shift_mag[2]);
    
endmodule

module mux_2x1 (a,b,y,s);
    input a,b;
    output y;
    input s;
    
    assign y=(b&s)|(a&(~s));
endmodule  