`timescale 1ns / 1ps

module mealyoverlapping_tb;
    reg din, clk, reset;
    wire dout;
    Mealy_overlapping uut(din,clk,reset,dout);
    
    always #50 clk =~clk;
 initial begin
        reset = 1;
        din = 0;
        clk = 0;
        #100; reset = 0; 
        din = 1;
    end
    always #100 din = $random;
        
    initial begin
        $monitor("clk=%b, reset=%b, din=%b, dout=%b", clk, reset, din, dout);
        #2000 $finish;
    end
endmodule

