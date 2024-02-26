module testbench();

  reg din;
  reg clk;
  wire det;

  POS_EDGE_DETCTOR uut(
    .din(din),
    .clk(clk),
    .det(det)
  );

  always begin
    #5 clk = ~clk;
  end

  initial begin
    clk = 0;
    din = 0;
    #15 din = 1;
    #20 din = 0;
    #15 din = 1;
    #10 din = 0;
    #15 din = 1;
    #20 din = 0;
    #15 din = 1;
    #10din = 0;
    
  end

  always @(posedge clk) begin
    $display("Time=%0t, din=%b, det=%b", $time, din, det);
  end

endmodule
