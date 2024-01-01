`timescale 1ns / 1ps

module Full_subtractor(
input a,b,bin,
output diff,barrow);

assign diff = bin^a^b;
assign barrow = (~a&b)+ ((~(a^b))& bin);

endmodule