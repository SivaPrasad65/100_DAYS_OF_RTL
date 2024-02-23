`timescale 1ns / 1ps

module Barrel_shifter_tb;
reg [7:0] in;
    reg [2:0] shift_mag;
    wire [7:0] out; 


    
    Barrel_shifter dut(in,shift_mag,out);
    
    initial begin
        $monitor("in=%d shift_mag=%d out=%d",in,shift_mag,out);
        in = 8'd0;
        shift_mag = 3'd0;
        #20; 
        in = 8'd16;
        shift_mag = 3'd1;
        #20;
        in = 8'd4;
        shift_mag = 3'd2;
        #20;
        $finish;
    end
    
endmodule