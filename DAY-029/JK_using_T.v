`timescale 1ns / 1ps

module JK_using_T(
input j,k,clk,rst,
output q
    );
   
   wire w1,w2,w3;
   assign w1 = ~q & j;
   assign w2 = q & k;
   assign w3 = w1 | w2;
    
    t_ff ff(w3,clk,rst,q);
    
endmodule


module t_ff(
input t,clk,rst,
output reg q
);

always@(posedge clk)
begin
    if(rst)
        q<=1'b0;
    else
      begin
      if(t)
        q<=~q;
        else
        q<=q;
    end
end
endmodule