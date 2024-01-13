`timescale 1ns / 1ps


module Gray_to_bin_bh(
input [3:0] gray,
output reg [3:0] bin
    );
    always@(*)
    begin
    case(gray)
        4'b0000 : bin=4'b0000;
        4'b0001 : bin=4'b0001;
        4'b0011 : bin=4'b0010;
        4'b0010 : bin=4'b0011;
        4'b0110 : bin=4'b0100;
        4'b0111 : bin=4'b0101;
        4'b0101 : bin=4'b0110;
        4'b0100 : bin=4'b0111;
        4'b1100 : bin=4'b1000; 
        4'b1101 : bin=4'b1001;
        4'b1111 : bin=4'b1010;
        4'b1110 : bin=4'b1011;
        4'b1010 : bin=4'b1100;
        4'b1011 : bin=4'b1101;
        4'b1001 : bin=4'b1110;
        4'b1000 : bin=4'b1111;
    endcase
    end
endmodule