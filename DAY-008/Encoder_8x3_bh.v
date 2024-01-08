`timescale 1ns / 1ps

module Encoder_8x3_bh(
input [7:0] i,
output reg [2:0] b 
    );
    always@(*)
    begin
    case(i)
    8'b0000_0001 : b=3'b000;
    8'b0000_0010 : b=3'b001;
    8'b0000_0100 : b=3'b010;
    8'b0000_1000 : b=3'b011;
    8'b0001_0000 : b=3'b100;
    8'b0010_0000 : b=3'b101;
    8'b0100_0000 : b=3'b110;
    8'b1000_0000 : b=3'b111;
    endcase
    end
endmodule
