`timescale 1ns / 1ps

module Round_Robin_Arbiter_tb;
reg clk, rst;
		reg [3:0] request;
		wire [3:0] grant;
		
		Round_Robin_Arbiter dut(clk,rst,request,grant);
		
		initial begin
		$monitor("clk=%b rst=%b request=%b grant=%b",clk,rst,request,grant);
		  clk = 0;
		  rst = 1;
		  #20 rst = 0;
		  request = 4'b0;
		  #20 request = 4'b1010;
		  #20 request = 4'b1000;
		  #20 request = 4'b1100;
		  #20 request = 4'b0100;
		  #20 request = 4'b0001;
		  #20 request = 4'b0010;
		  #20 request = 4'b0110;
		  #20 request = 4'b1110;
		  #20 request = 4'b1111;
		  #20 $finish;	
		end
          always #5 clk = ~clk;
endmodule
