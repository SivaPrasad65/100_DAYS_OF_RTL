`timescale 1ns / 1ps

module Demux(
input a,
input [2:0] s,
output [7:0] y
    );
   
  wire w1,w2,w3;
  assign w1=~s[0];
  assign w2=~s[1];  
  assign w3=~s[2]; 
  assign y[0] = a&w3&w2&w1;
  assign y[1] = a&w3&w2&s[0];
  assign y[2] = a&w3&s[1]&w1;
  assign y[3] = a&w2&s[1]&s[0]; 
  assign y[4] = a&s[2]&w2&w1; 
  assign y[5] = a&s[2]&w2&s[0];
  assign y[6] = a&s[2]&s[1]&w1;
  assign y[7] = a&s[2]&s[1]&s[0];  
  
endmodule
