`timescale 1ns / 1ps

module carry_save_adder_tb;
reg [3:0] a;
reg [3:0] b;
reg cin;
reg [3:0] x;
wire [3:0] cout;
wire [4:0] sum;

carry_save_adder dut(a,b,cin,x,cout,sum);

initial begin
cin = 0;
x=4'b0000;

$monitor("a=%b b=%b cin =%b sum = %b cout =%b",a,b,cin,sum,cout);
#1000 $finish;
end

always begin
a=$random;
b=$random;
#50;

end
endmodule
