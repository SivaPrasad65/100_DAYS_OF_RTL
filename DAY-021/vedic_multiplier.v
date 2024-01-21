`timescale 1ns / 1ps

module vedic_multiplier(
input [3:0] a,
input [3:0] b,
output [7:0] p
    );
    
    wire [3:0] q0;
    wire [3:0] q1;
    wire [3:0] q2;
    wire [3:0] q3;
    wire [3:0] q4;
    wire [5:0] q5;
    wire [5:0] q6;
    wire [3:0] temp0;
    wire [5:0] temp1;
    wire [5:0] temp2;
    wire [5:0] temp3;
 
    
    vedic_2bit v1(a[1:0],b[1:0],q0[3:0]);
    vedic_2bit v2(a[1:0],b[3:2],q1[3:0]);
    vedic_2bit v3(a[3:2],b[1:0],q2[3:0]);
    vedic_2bit v4(a[3:2],b[3:2],q3[3:0]);
    
    assign temp0 = {2'b0,q0[3:2]};
    add_4bit a1(temp0,q1[3:0],q4);
    
    assign temp1 ={2'b0,q2[3:0]};
    assign temp2 ={q3[3:0],2'b0};
    add_6bit a2(temp1,temp2, q5);
    
    assign temp3={2'b0,q4};
    add_6bit a3(temp3,q5,q6);
    
    assign p[1:0] = q0[1:0];
    assign p[7:2] = q6[5:0];
    
endmodule

module add_4bit(
input [3:0] a,b,
output [3:0] sum);
assign sum = a+b;
endmodule


module add_6bit(
input [5:0] a,b,
output [5:0] sum);
assign sum = a+b;
endmodule


module vedic_2bit(
input [1:0] a,
input [1:0] b,
output [3:0] product
    );
   wire  [3:0]p;
   wire  [3:0] w;
   and (p[0],a[0],b[0]);
   and (w[0],a[0],b[1]);
   and (w[1],a[1],b[0]);
   and (w[2],a[1],b[1]);
   
   
   half_adder ha1(p[1],w[3],w[0],w[1]);
   half_adder ha2(p[2],p[3],w[2],w[3]);
    
   assign product = {p[3:0]};
endmodule

module half_adder(
output sum,carry,
input a,b
);

assign sum = a^b;
assign carry = a&b;

endmodule
