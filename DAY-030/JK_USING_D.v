`timescale 1ns / 1ps

module JK_USING_D(
input j,k,clk,
output q,qbar
    );
   wire w1,w2,w3;
  assign w1 = j&qbar;
  assign w2 = (~k&q);
  assign w3 =(w1 | w2);
  
   d_ff dut(w3,clk,q,qbar); 
     
endmodule


module d_ff(
input d,clk,
output reg q,qbar);

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
