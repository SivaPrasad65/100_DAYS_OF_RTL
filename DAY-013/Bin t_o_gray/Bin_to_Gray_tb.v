`timescale 1ns / 1ps

module Bin_to_Gray_tb;
reg [3:0] bin;
wire [3:0] gray;

Bin_to_gray dut( bin,gray);
initial begin
bin=0;
#10 bin[0] = ~bin[0];
#20 bin[1] = ~bin[1];
#40 bin[2] = ~bin[2];
#80 bin[3] = ~bin[3];
#200 $finish;
end
endmodule
