`timescale 1ns / 1ps


module HAMMING_DECODER(
input [6:0] encoded_data,
    output [3:0] data,
    output [2:0] error_position,
    output is_error
    ); 
    
    assign data[0]= encoded_data[2];
    assign data[1]= encoded_data[4];
    assign data[2]= encoded_data[5];
    assign data[3]= encoded_data[6];
    
    assign c1= encoded_data[0]^encoded_data[2]^encoded_data[4]^encoded_data[6]; 
    assign c2= encoded_data[1]^encoded_data[2]^encoded_data[5]^encoded_data[6]; 
    assign c3= encoded_data[3]^encoded_data[4]^encoded_data[5]^encoded_data[6]; 
    assign error_position= {c3,c2,c1};
    assign is_error = c3 |c2 | c1;
  
endmodule
