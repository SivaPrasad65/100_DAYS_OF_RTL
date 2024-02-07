`timescale 1ns / 1ps

module universal_shift_register( clk,rst,sin, mode,data_in, out);
input clk,rst,sin;
input [1:0] mode;
input [3:0] data_in;
output reg [3:0] out;
always@(posedge clk,posedge rst)
begin
    if(rst) begin
    out<=4'b0000;
    end
    else
    begin
    case(mode)
    2'b00: out<= out;
    2'b01 :out<={sin,out[3:1]};     
    2'b10 : out<={out[2:0],sin};
    2'b11: out<=data_in;
    endcase
end
end
endmodule
