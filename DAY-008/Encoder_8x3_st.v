module Encoder_8x3_st(
input [7:0] i,
output [2:0] b 
    );
or o1(i[1],i[3],i[5],i[7],b[0]);
or o2(i[2],i[3],i[6],i[7],b[1]);
or o3(i[4],i[5],i[6],i[7],b[2]);
endmodule