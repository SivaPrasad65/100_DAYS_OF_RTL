`timescale 1ns / 1ps

module johnson_counter_tb;
reg clk,rst;
wire [3:0] q;

Johnson_counter dut(clk,rst,q);
always #5 clk=~clk;
initial begin
clk=0;
rst=1;
#10;
rst=0;
#200 $stop;
end

endmodule
