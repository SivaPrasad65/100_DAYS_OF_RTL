`timescale 1ns / 1ps
module full_subtractor_st(
input a,b,bin,
output diff,barrow);

wire w1,w2,w3,a_bar;
not a1(a_bar,a);
xor x1(diff,a,b,bin);
and a2(w1,a_bar,b);
and a3(w2,a_bar,bin);
and a4(w3,b,bin);
or or1(barrow,w1,w2,w3);

endmodule