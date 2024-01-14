`timescale 1ns / 1ps


module ripple_carry_tb();
reg [3:0] a;
reg [3:0] b;
reg cin;
wire [3:0] s;
wire cout;

Ripple_carry_adder dut(a,b,cin,s,cout);

initial
begin
a=4'b0000; b=4'b0000;cin=0;
#100; a=4'b0101;b=4'b1010;cin=0;
#100; a=4'b1100;b=4'b1010;cin=0;
#100; a=4'b0011;b=4'b0111;cin=1;

#100 $finish;
end


endmodule