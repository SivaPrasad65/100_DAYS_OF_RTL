module Bin_to_Gray_st(
input [3:0] bin,
output [3:0] gray
    );
    buffer b1(gray[3],bin[3]);
    xor x1(gray[2],bin[3],bin[2]),
        x2(gray[1],bin[2],bin[1]),
        x3(gray[0],bin[1],bin[0]);
endmodule
    
 module buffer(
 output s,
 input a);
 assign s = a;
endmodule