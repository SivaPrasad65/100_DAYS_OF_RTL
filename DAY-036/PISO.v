`timescale 1ns / 1ps

module PISO(
output qout,qout_bar,
    input [3:0]din,
    input clk,rst,shift_mode
    );
    wire [2:0]q;
    wire [2:0]qbar;
    wire n_shift_mode;
    wire [5:0]aw;
    wire [2:0]wo;
    
    d_ff ff1(q[0],qbar[0],din[0],clk,rst);

   not(n_shift_mode,shift_mode);
   and(aw[0],q[0],shift_mode);
   and(aw[1],n_shift_mode,din[1]);
   or(wo[0],aw[0],aw[1]);
   
    d_ff ff2(q[1],qbar[1],wo[0],clk,rst);
    
    and(aw[2],q[1],shift_mode);
   and(aw[3],n_shift_mode,din[2]);
   or(wo[1],aw[2],aw[3]);
   
    d_ff ff3(q[2],qbar[2],wo[1],clk,rst);
    
    and(aw[4],q[2],shift_mode);
   and(aw[5],n_shift_mode,din[3]);
   or(wo[2],aw[4],aw[5]);
    d_ff ff4(qout,qout_bar,wo[2],clk,rst);
    
endmodule

module d_ff(
    output reg q,qb,
    input d,clk,rst
    );

    always @(posedge clk )
        if (rst)
        begin
            q <= 0;
            qb <= 1;
        end
        else
        begin
            q <= d;
            qb <= ~d;
        end

endmodule