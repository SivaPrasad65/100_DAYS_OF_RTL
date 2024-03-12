`timescale 1ns / 1ps

module HAMMING_ENCODER(
    input [3:0]data,
    output [6:0] encoded
    );
    
    assign encoded[0]=data[0] ^ data[1] ^ data[3];
    assign encoded[1]=data[0] ^ data[2] ^ data[3];
    assign encoded[2]=data[0];
    assign encoded[3]=data[1] ^ data[2] ^ data[3];
    assign encoded[4]=data[1];
    assign encoded[5]=data[2];
    assign encoded[6]=data[3];
    
endmodule
