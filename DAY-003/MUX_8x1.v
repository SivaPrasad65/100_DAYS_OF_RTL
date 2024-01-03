`timescale 1ns / 1ps

module MUX_8x1(
input [7:0] a,
input [2:0] s,
output y
    );
    wire w1,w0,w2;
    assign w2 = ~s[2];
    assign w1 = ~s[1];
    assign w0 = ~s[0];
    
    assign y = (w2&w1&w0&a[0])|(w2&w1&s[0]&a[1])|(w2&s[1]&w0&a[2])|(w2&s[1]&s[0]&a[3])|(s[2]&w1&w0&a[4])|(s[2]&w1&s[0]&a[5])|(s[2]&s[1]&w0&a[6])|(s[2]&s[1]&s[0]&a[7]);
    
endmodule
