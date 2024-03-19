`timescale 1ns / 1ps

module convolutional_encoder(
input [4:0]x,
output reg [5:0] y
    );
    always@(*)
    begin
    y[5] = x[0] ^ x[1] ^ x[2];
    y[4] = x[2] ^ x[0];
    y[3] = x[1] ^ x[2] ^ x[3];
    y[2] = x[3] ^ x[1];
    y[1] = x[2] ^ x[3] ^ x[4];
    y[0] = x[4] ^ x[2];
    end
    
endmodule
