`timescale 1ns / 1ps

module even_odd_tb;
reg [3:0]number;
wire even_odd;

Even_Odd dut(number, even_odd);

always 
begin
number=4'd6;
#10;
number=4'd3;
#10;
number=4'd14;
#10;
number=4'd10;
#10;
number=4'd11;
#10;
number=4'd7;
#10;
end

initial #60 $finish;
endmodule