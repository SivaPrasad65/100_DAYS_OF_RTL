`timescale 1ns / 1ps


module demux_tb;
reg a;
reg [2:0] s;
wire [7:0] y;
  
Demux dut(a,s,y);
initial begin
a=8'b00000000;
s[0]=0;
s[1]=0;
s[2]=0;
#100 a = 8'hfa;
#100 a = 8'h05;
#100 a = 8'h10;
#100 $finish;
end
always #100 s[0] = ~s[0];
always #200 s[1] = ~s[1];
always #400 s[2] = ~s[2];

endmodule
