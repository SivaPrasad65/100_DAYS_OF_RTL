`timescale 1ns / 1ps


module piso_tb;
    wire qout,qout_bar;
    reg [3:0]din;
    reg clk,rst;
    reg shift_mode;
    PISO dut(qout,qout_bar,din,clk,rst,shift_mode);
    
    initial begin
        rst=1;
        clk=0;
        #50 rst= 0;
        $monitor("qout=%b qout_bar=%b din=%b clk=%b rst=%b shift_mode=%b",qout,qout_bar,din,clk,rst,shift_mode);
        #1000 $finish;
    end
    initial begin
    shift_mode = 0;
    #500 shift_mode = ~shift_mode;
    end
    always #25 clk=~clk;
    always begin
        din =$random;
        #50;
    end
    
endmodule