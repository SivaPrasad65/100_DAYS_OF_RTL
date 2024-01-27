`timescale 1ns / 1ps


module TB;
 reg  clk, rstn, d; 
    wire q,qbar;
  D_using_t uut(clk, rstn, d, q, qbar);
    initial
    begin
        d = 0;
        rstn = 0;
        clk = 0;
        #100 rstn = 1;
        $monitor("q=%b qbar=%b d=%b rstn=%b clk=%b",q, qbar, d, rstn, clk);
        #500 $finish;
    end
    always #100 d = ~d;
    always #50 clk = ~clk;
endmodule

