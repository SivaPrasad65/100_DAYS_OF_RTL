`timescale 1ns / 1ps

module full_subtractor_tb;
reg a,b,bin;
wire diff,barrow;
full_subtractor_st dut(a,b,bin,diff,barrow);
initial begin
    a=0;
    b=0;
    bin=0;
end
always #100 a=~a;
always #200 b=~b;
always #400 bin=~bin;

endmodule
