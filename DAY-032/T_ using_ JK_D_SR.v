`timescale 1ns / 1ps

module T_using_JK_D_SR(
input t,clk,rst,
output q_jk,q_d,q_sr);

wire w1,w2,w3;
jk ff2(t,t,clk,rst,q_jk);

assign w3=t^q_d;
d_ff ff1(w3,clk,rst,q_d);

assign w1=(t&(~q_sr));
assign w2=(t&q_sr);
sr_ff ff3(w1,w2,clk,rst,q_sr);



endmodule


module jk(
input j,k,clk,rst,
output reg q);

always@(posedge clk)
begin
if({rst})
q<=0;
else 
begin
case({j,k})
2'b00:q<=q;
2'b01:q<=0;
2'b10:q<=1;
2'b11:q<=~q;
endcase
end
end

endmodule

module d_ff(
input d,clk,rst,
output reg q);

always@(posedge clk)
begin
if({rst})
q<=1'b0;
else 
q<=d;
end
endmodule

module sr_ff(
input s,r,clk,rst,
output reg q);

always @(posedge clk)
begin
if({rst})
q<=1'b0;
else 
begin
case({s,r})
2'b00:q<=q;
2'b01:q<=0;
2'b10:q<=1;
2'b11:q<=2'bxx;
default:q<=2'bxx;
endcase
end
end
endmodule