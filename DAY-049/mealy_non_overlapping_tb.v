`timescale 1ns / 1ps
module mealy_non_overlapping_tb;
reg din, clk, reset;
    wire dout;
    
mealy_non_overlapping uut (din,clk,reset,dout);

    always #50 clk = ~clk;
    initial begin
        reset = 1;
        din = 0;
        clk = 0;
        #100; reset = 0; 
        din = 1;
        #100; din = 0;
        #100; din = 1;
        #100; din = 0; 
        #100; din = 1;
        #100; din = 0;
        #100; din = 0;
        #100; din = 1; 
        #100; din = 0;
        #100; din = 0;
        #100; din = 1; 
    end

    initial begin
        $monitor("clk=%b, reset=%b, din=%b, dout=%b", clk, reset, din, dout);
        #2000 $finish;
    end
endmodule
