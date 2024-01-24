`timescale 1ns / 1ps

module jk_ff(
input j,k,clk,
output reg q,
output reg qb
    );
 always@(posedge clk) begin
 q=1'b0;qb=1'b1;
 if(clk==1)begin
 if(j==0 && k==0)
     begin
     q<=q;
     qb<=qb;
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
     q=~q;
     qb=~qb;
     end
     end
     if(clk==0)
     begin
     q=q;qb=qb;
     end
 end
endmodule
