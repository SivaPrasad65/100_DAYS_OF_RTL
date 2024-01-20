`timescale 1ns / 1ps

module Multiplier_4bit(
input [3:0] a,
input [3:0] b,
output [7:0] product
    );
    wire [14:0] w;
    wire [7:0] p;
    wire [10:0] c;
    wire [5:0] s;
    
    and(p[0], a[0],b[0]);
    and(w[0], a[1],b[0]);
    and(w[1], a[2],b[0]);
    and(w[2], a[3],b[0]);
    
    and(w[3], a[0],b[1]);
    and(w[4], a[1],b[1]);
    and(w[5], a[2],b[1]);
    and(w[6], a[3],b[1]);
    
    half_adder ha1(w[0],w[3],p[1],c[0]);
    full_adder fa1(w[1],w[4],c[0],s[0],c[1]); 
    full_adder fa2(w[2],w[5],c[1],s[1],c[2]);
    half_adder ha2(w[6],c[2],s[2],c[3]);
    
    and(w[7], a[0],b[2]);
    and(w[8], a[1],b[2]);
    and(w[9], a[2],b[2]);
    and(w[10], a[3],b[2]);
    
    half_adder ha3(w[7],s[0],p[2],c[4]);
    full_adder fa3(w[8],s[1],c[4],s[3],c[5]); 
    full_adder fa4(w[9],s[2],c[5],s[4],c[6]); 
    full_adder fa5(w[10],c[3],c[6],s[5],c[7]); 
    
    and(w[11], a[0],b[3]);
    and(w[12], a[1],b[3]);
    and(w[13], a[2],b[3]);
    and(w[14], a[3],b[3]);
    
    half_adder ha4(w[11],s[3],p[3],c[8]);
    full_adder fa6(w[12],s[4],c[8],p[4],c[9]); 
    full_adder fa7(w[13],s[5],c[9],p[5],c[10]); 
    full_adder fa8(w[14],c[7],c[10],p[6],p[7]); 
    
    assign product ={p[7:0]};
    
endmodule

module half_adder(
input a,b,
output sum,carry);

assign sum=a^b;
assign carry = a&b;

endmodule


module full_adder(
input a,b,cin,
output sum, carry);


assign sum = a^b^cin;
assign carry = (a&b) | (b&cin) | (cin&a);

endmodule
