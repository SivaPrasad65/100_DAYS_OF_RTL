`timescale 1ns / 1ps

module priority_encoder_tb;
reg [7:0] in;
wire [2:0] y;

 Priority_encoder dut(in,y);
 
 always begin
 in=$random;
 #10;
 end
 initial begin
 $monitor("in = %b y=%b",in,y);
 #100 $finish();
 end
endmodule
