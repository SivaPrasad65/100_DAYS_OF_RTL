`timescale 1ns / 1ps

module LIFO(
input clk,rstn,pop,push,
  input [7:0] data_in,
  output reg [7:0] data_out,
  output is_empty,is_full
);
    
    reg [7:0] stack[7:0]; 
    reg [7:0] index, next_index; 
    reg [7:0]  next_data_out;
    
    assign is_empty = (index == 8'h00) ? 1 : 0;
    assign is_full = (index == 8'h07) ? 1 : 0;
    
    always @(posedge clk) 
    begin
      if (!rstn)
      begin
        data_out <= 8'd0;
        index <= 8'd0;
      end
      else
      begin
        data_out <= next_data_out;
        index <= next_index;
      end
    end

    always @(*) begin
      if (push) begin
        stack[index] = data_in;
        next_index = index + 1;
      end
      else if (pop) begin
        next_data_out = stack[index - 1];
        next_index = index - 1;
      end
      else begin
        next_data_out = data_out;
        next_index = index;
      end
    end
    
endmodule
