`timescale 1ns / 1ps

module D_USING_JK(
output q_t,q_tb,
input d,clk,reset
 );
 wire j,k;
 assign j=d;
 assign k=~d;
 
 jk_ff ff(q_t,q_tb,j,k,clk,reset);
    
endmodule


module jk_ff(
output reg q,
output reg qb,
input j,k,clk,rst);

initial begin
q=0;
qb=1;
end

always@(posedge clk)
begin
if(j==0 && k==0)
begin
q<=q;
qb<=~qb;
end
else if(j==0 && k==1)
begin
q<=0;
qb<=1;
end
else if(j==1 && k==0)
begin
q<=1;
qb<=0;
end
else if(j==1 && k==1)
begin
q<=~q;
qb<=qb;
end
end
endmodule