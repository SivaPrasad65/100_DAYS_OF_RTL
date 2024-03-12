`timescale 1ns / 1ps


module HAMMING_DECODER_TB;
 reg [6:0] encoded_data;
    wire [2:0]error_position;
    wire is_error; 
    wire [3:0]data;
    
    HAMMING_DECODER dut(encoded_data,data,error_position,is_error);
    
    initial begin   
    $monitor("%d %d %d",data,is_error,error_position);
    encoded_data= 7'b0110011;
    #20 encoded_data= 7'b1010010;
    #20 encoded_data= 7'b1111000;
    #20 encoded_data= 7'b0011001;
    #20 $finish;
    end
  
endmodule
