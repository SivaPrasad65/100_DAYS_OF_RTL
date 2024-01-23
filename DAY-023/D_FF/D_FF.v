`timescale 1ns / 1ps

module D_FF(
input d,clk,
output reg q,qbar );

always@(posedge clk)
begin
q=1'b0;qbar=1'b1;

if(clk==1)
begin
if(d==0)
begin
q=1'b0;qbar=1'b1;
end
if(d==1)
begin
q=1'b1;qbar=1'b0;
end
end

if(clk==0)
begin
q=q; qbar=qbar;
end
end
endmodule
