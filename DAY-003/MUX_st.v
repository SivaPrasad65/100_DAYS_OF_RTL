`timescale 1ns / 1ps

module MUX_st(
input [7:0] a,
input [2:0] s,
output  y
    );
    wire w0,w1,w2,b,c,d,e,f,g,h,i;
    
    not n1(w0,s[0]);
    not n2(w1,s[1]);
    not n3(w2,s[2]);


    and x1(b,w2,w1,w0,a[0]);
    and x2(c,w2,w1,s[0],a[1]);
    and x3(d,w2,s[1],w0,a[2]);
    and x4(e,w2,s[1],s[0],a[3]);
    and x5(f,s[2],w1,w0,a[4]);
    and x6(g,s[2],w1,s[0],a[5]);
    and x7(h,s[2],s[1],w0,a[6]);
    and x8(i,s[2],s[1],s[0],a[7]);
    
    or(y,b,c,d,e,f,g,h,i);
endmodule
