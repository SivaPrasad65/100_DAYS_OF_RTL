`timescale 1ns / 1ps

module comparator_bh(
    input [3:0] a,
    input [3:0] b,
    output reg equal,
    output reg grt,
    output reg lst
);

  always @(a or b) begin
    lst <= (a < b);
    equal <= (a == b);
    grt <= (a > b);
  end
  
endmodule
