`timescale 1ns / 1ps

module carry_skip_adder_tb;
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;

carr_skip_adder_st dut(a,b,cin,sum,cout);

initial begin
$monitor("a=%b b=%b cin sum=%b cout =%b",a,b,cin,sum,cout);
#500 $finish;

end
always begin
a=$random;
b=$random;
cin=0;
#100;
end
endmodule