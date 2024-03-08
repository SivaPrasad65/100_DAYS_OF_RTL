`timescale 1ns / 1ps

module wallace_multiplier_tb;
reg [3:0] A,B;
    wire [7:0] product;

    wallace_multiplier dut(A,B,product);
    
    initial  begin
        A = 0;
        B = 0;
        #200 $finish;
     end
     
    always begin
        A = $random;
        B = $random;
        #10;
    end
      
endmodule