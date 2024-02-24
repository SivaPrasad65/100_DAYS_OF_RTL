`timescale 1ns / 1ps

module Fixed_Priority_Arbiter_tb;
 parameter Num_Requests = 4;
  reg [Num_Requests-1:0] Request;
  wire [Num_Requests-1:0] Grant;

  Fixed_Priority_Arbiter uut(Request,Grant);
  
  initial begin
    Request = 4'b0000;
    $monitor("Time=%0t Request=%b Grant=%b",$time,Request,Grant);
    #200 $finish;
  end
    always #20 Request = $random;
endmodule
