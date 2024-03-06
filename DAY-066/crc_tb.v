`timescale 1ns / 1ps


module crc_tb;
reg clk; 
reg rst; 
reg load; 
reg d_finish; 
reg crc_in; 
wire crc_out; 
CRC_SERIAL u1(.clk(clk), .rst(rst), .load(load), .d_finish(d_finish), .crc_in(crc_in), .crc_out(crc_out)); 

initial 
begin 
 #10 clk = 0 ;
 #10 rst = 0; 
 #10 rst = 1; 
 #10 crc_in = 1; // Enter the data to be encoded
 #10 load = 1; 
 #10 load = 0; 
 #10 d_finish = 0; 
 #800 d_finish = 1; 
 #10 d_finish = 0; 
end
always #(5) clk = ~clk; //Change the power level every 20ns
always #(20) crc_in = ~crc_in; // change the input level for the word to be encoded every 80ns 

//Call the serial encoding module

endmodule
