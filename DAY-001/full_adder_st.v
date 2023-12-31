`timescale 1ns / 1ps


module full_adder_st(
    output sum,carry,
    input a,b,Cout
    );
wire w1,w2,w3;

xor x1(sum,a,b,cin);
and a1(w1,a,b),
    a2(w2,a,cin),
    a3(w3,b,cin);                                            
or o1(carry,w1,w2,w3);
endmodule
