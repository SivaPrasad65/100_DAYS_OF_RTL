`timescale 1ns / 1ps

module KOGGE_STONE_ADDER_TB;
  reg [3:0] a, b;
  reg cin;
  wire [4:0] sum_out;
  KOGGE_STONE_ADDER dut (a,b,cin,sum_out);
  initial begin
    $monitor("Time=%0t, A=%b, B=%b, Cin=%b, Sum_out=%b", $time, a, b, cin, sum_out);
        cin = 0;
    #100 $finish;
  end
  always begin
    a = $random;
    b = $random;
    #10;
  end
  
endmodule
