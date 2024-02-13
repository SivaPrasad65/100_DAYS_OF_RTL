`timescale 1ns / 1ps

module Ring_counter(
input clk,rst,
output [3:0] count
    );
     reg [3:0]temp;
    always@(posedge clk)
    begin
    if(rst)begin
    temp<=4'b0001;
    end
    else begin
    temp <= {temp[2:0],temp[3]};
    end
    end
  assign count=temp;

    
endmodule
