`timescale 1ns / 1ps

module comparator_4bit(
    input [3:0] a,
    input [3:0] b,
    output equal,
    output grt,
    output lst
    );
    assign equal=~(a[3]^b[3]) & ~(a[2]^b[2]) &~(a[1]^b[1]) & ~(a[0]^b[0]);
    assign grt=(a[3]&~b[3]) | ~(a[3]^b[3]) & (a[2]&~b[2]) | ~(a[3]^b[3]) & ~(a[2]^b[2]) & (a[1]&~b[1]) | ~(a[3]^b[3]) & ~(a[2]^b[2]) &~(a[1]^b[1]) & (a[0]&~b[0]);
    assign lst=(~a[3]&b[3]) | ~(a[3]^b[3]) & (~a[2]&b[2]) | ~(a[3]^b[3]) & ~(a[2]^b[2]) & (~a[1]&b[1]) | ~(a[3]^b[3]) & ~(a[2]^b[2]) &~(a[1]^b[1]) & (~a[0]&b[0]); 
endmodule