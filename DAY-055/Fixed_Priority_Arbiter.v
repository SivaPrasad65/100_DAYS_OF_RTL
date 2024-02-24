`timescale 1ns / 1ps

module Fixed_Priority_Arbiter
#(parameter Num_Requests=4)(
  input [Num_Requests-1:0] Request,
  output [Num_Requests-1:0] Grant
);
    assign Grant[Num_Requests-1] = Request[Num_Requests-1];
    genvar i;

    for (i = Num_Requests-2; i >=0; i = i - 1) begin
      assign Grant[i] = Request [i] && (~(|(Request[Num_Requests-1:i+1])));
    end

endmodule
