`timescale 1ns / 1ps


module Tb;
reg t,clk,rst;
wire q_jk,q_d,q_sr;

T_using_JK_D_SR dut(t,clk,rst,q_jk,q_d,q_sr);
initial begin
    clk = 0;
    forever #5 clk = ~clk;  
  end

 
  initial begin
    rst = 1;
    t=0;
    #10 rst = 0;  
  end

  initial begin
    #5 t = 1;
    #5 t = 0;
    #5 t = 1;
    #5 t = 0;
    #5 t = 1;
    #5 t = 0;
    #5 t = 1;

    #10 $finish();
  end

  // Display results
  always @(posedge clk) begin
    $display("Time=%0t, t=%b, q_jk=%b, q_d=%b, q_sr=%b", $time, t, q_jk, q_d, q_sr);
  end

endmodule
