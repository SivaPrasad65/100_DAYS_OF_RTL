`timescale 1ns / 1ps

module sr_nor_tb;
   reg s,r;
    wire q,qbar;
    SR_NOR_LATCH dut(s,r,q,qbar);
    initial
    begin
    s=0;r=0;
    #10 s=0;r=1;
    #10 s=1;r=0;
    #10 s=1;r=1;
    #10 $finish;
    end
endmodule
