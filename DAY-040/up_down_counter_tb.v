`timescale 1ns / 1ps

module up_down_counter_tb;
reg clk,reset,upordown; 
wire [3:0] Count;
up_down_counter dut(.clk(clk),.reset(reset),.Count(Count),.upOrDown(upordown));
initial clk=0;
always #2 clk=~clk;
initial begin
reset=1 ; #10; 
reset=0; 
upordown=0;
#50;
upordown=1; 
#160; $finish();
end
endmodule
