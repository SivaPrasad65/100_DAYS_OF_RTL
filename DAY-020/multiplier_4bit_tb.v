`timescale 1ns / 1ps

module multiplier_4bit_tb;
reg [3:0] a;
reg [3:0] b;
wire [7:0] product;

Multiplier_4bit dut(a,b,product);

initial begin
$monitor("a=%b b=%b product=%b ",a,b,product);
#500 $finish;
end

always begin
a=$random;
b=$random;
#50;
end

endmodule

