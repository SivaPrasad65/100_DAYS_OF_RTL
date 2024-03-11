`timescale 1ns / 1ps


module KOGGE_STONE_ADDER(
 input [3:0]a,b,
    input cin,
    output [4:0]sum_out
        );
    wire [3:0] p,g,prop_gen,carry_gen,carry_cascade,prop_cascade,c,sum;
    
    assign p=a^b;
    assign g=a&b;
    
    assign carry_gen[0]=(g[0]);
    assign prop_gen[0]=(p[0]);
    
    assign carry_gen[1]=(p[1]&g[0])|g[1];
    assign prop_gen[1]=(p[1]&p[0]);
    
    assign carry_gen[2]=(p[2]&g[1])|g[2];
    assign prop_gen[2]=p[2]&p[1];
    
    assign carry_gen[3]=(p[3]&g[2])|g[3];
    assign prop_gen[3]=p[3]&p[2];
    
    assign carry_cascade[0]=carry_gen[0];
    assign prop_cascade[0]=prop_gen[0];
    
    assign carry_cascade[1]=carry_gen[1];
    assign prop_cascade[1]=prop_gen[1];
    
    assign carry_cascade[2]=(prop_gen[2]&carry_gen[0])|carry_gen[2];
    assign prop_cascade[2]=prop_gen[2]&prop_gen[0];
    
    assign carry_cascade[3]=(prop_gen[3]&carry_gen[1])|carry_gen[3];
    assign prop_cascade[3]=prop_gen[3]&prop_gen[1];
    
    assign c = carry_cascade;
    assign sum[0]=p[0]^cin;
    assign sum[1]=p[1]^c[0];
    assign sum[2]=p[2]^c[1];
    assign sum[3]=p[3]^c[2];
    assign sum_out = {c[3],sum};
    
endmodule
