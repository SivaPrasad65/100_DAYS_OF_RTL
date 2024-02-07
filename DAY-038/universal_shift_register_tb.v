`timescale 1ns / 1ps
module universal_shift_register_tb;
reg clk,rst,sin;
reg [1:0] mode;
reg [3:0] data_in;
wire [3:0] out;

universal_shift_register DUT(clk,rst,sin,mode,data_in,out);
always #5 clk=~clk;
initial begin
clk=0;
rst=1;
data_in=4'b1010;
sin=1'b0;
mode=2'b00;
#10rst=0;
#100 $stop;
end

always #4 mode = mode+1;
always #1 sin= ~sin;
    
endmodule
