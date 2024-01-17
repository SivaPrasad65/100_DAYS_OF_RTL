`timescale 1ns / 1ps


module carry_save_adder(
input [3:0] a,
input [3:0] b,
input cin,
input [3:0] x,
output [3:0] cout,
output [4:0] sum
    );
    wire [3:0] c;
    wire [3:1] s;
    full_adder fa1(a[0],b[0],cin,sum[0],c[0]);
    full_adder fa2(a[1],b[1],cin,s[1],c[1]);
    full_adder fa3(a[2],b[2],cin,s[2],c[2]);
    full_adder fa4(a[3],b[3],cin,s[3],c[3]);
    
    
    full_adder fa5(c[0],s[1],cin,sum[1],cout[0]);
    full_adder fa6(c[1],s[2],cout[0],sum[2],cout[1]);
    full_adder fa7(c[2],s[3],cout[1],sum[3],cout[2]);
    full_adder fa8(c[3],x,cout[2],sum[4],cout[3]);
   
endmodule

module full_adder(
input a,b,cin,
    output s,cout
    );
    wire w1,w2,w3;
    xor a1(s,a,b,cin);
    and a2(w1,a,b);
     and a3(w2,cin,b);
      and a4(w3,a,cin);
      or a5(cout,w1,w2,w3);
endmodule