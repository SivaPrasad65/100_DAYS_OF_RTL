`timescale 1ns / 1ps

module ring_counter_tb;
reg clk,rst;
wire [3:0] count;
Ring_counter dut(clk,rst,count);
always #5 clk=~clk;
initial begin
clk=0;
rst=1;
#10;
rst=0;
#100 $stop;
end

endmodule
