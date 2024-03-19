`timescale 1ns / 1ps

module convolutional_encoder_tb;
parameter CLK_PERIOD =10;
reg [4:0] x;
wire [5:0] y;
convolutional_encoder dut(.x(x),.y(y));
reg clk=0;
always #((CLK_PERIOD)/2)clk=~clk;
initial begin
x=6'b000000;
#10;
x=6'b100001;
#10;
x=6'b010010;
#10;
x=6'b110011;
#10;
$stop;
end
endmodule
