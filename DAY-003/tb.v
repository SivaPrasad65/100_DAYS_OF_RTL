`timescale 1ns / 1ps


module tb;
reg [7:0] a;
reg [2:0] s;
wire y;
MUX_8x1 dut(a,s,y);
initial begin
a=8'b00000000;
s[0]=0;
s[1]=0;
s[2]=0;
#100 a = 8'hca;
#200 a = 8'h0f;
#500 a = 8'h5a;
#1500 $finish();
end
always #100 s[0] = ~s[0];
always #200 s[1] = ~s[1];
always #400 s[2] = ~s[2];

endmodule
