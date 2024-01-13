`timescale 1ns / 1ps

module Gray_to_Bin(
input [3:0] gray,
output [3:0] bin
    );
    assign bin[3] = gray[3];
    assign bin[2] = bin[3]^gray[2];
    assign bin[1] = bin[2]^gray[1];
    assign bin[0] = bin[1]^gray[0];
endmodule
