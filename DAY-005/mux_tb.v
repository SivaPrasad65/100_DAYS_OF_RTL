`timescale 1ns / 1ps


module mux_tb;
reg [7:0] i;
reg [2:0] s;
wire y;

mux8x1_4x1mux dut(i,s,y);
initial begin
i=8'b00000000;
s[0]=0;
s[1]=0;
s[2]=0;
#100 i = 8'hca;
#200 i = 8'h0f;
#500 i = 8'h5a;
#1500 $finish();
end
always #100 s[0] = ~s[0];
always #200 s[1] = ~s[1];
always #400 s[2] = ~s[2];

endmodule


