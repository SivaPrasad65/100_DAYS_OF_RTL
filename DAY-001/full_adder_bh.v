`timescale 1ns / 1ps

module full_adder_bh (
    output reg sum, carry,
    input a, b, Cout
);
    always @(*)
    begin
 {sum,carry} = a + b + Cout;
 end 
endmodule