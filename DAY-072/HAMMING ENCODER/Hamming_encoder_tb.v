`timescale 1ns / 1ps


module Hamming_encoder_tb;
    reg [3:0]data;
    wire [6:0] encoded;
    
    HAMMING_ENCODER dut(data, encoded);
    
    initial begin
     $monitor("%d %d",data,encoded);
     data=4'b0110;
     #20 data = 4'b1010;
     #20 data = 4'b1110;
     #20 data = 4'b0010;
     #20 $stop;  
    end
endmodule
