`timescale 1ns / 1ps


module Gray_to_bin_tb;
reg [3:0] gray;
wire [3:0] bin;

Gray_to_Bin dut( gray,bin);
initial begin
gray=0;
#10 gray[0] = ~gray[0];
#20 gray[1] = ~gray[1];
#40 gray[2] = ~gray[2];
#80 gray[3] = ~gray[3];
#200 $finish;
end
endmodule
