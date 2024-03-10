`timescale 1ns / 1ps

module Fir_filter(
input clk,
  input rst,
  input [7:0] x,
  output reg [7:0] y
);

  // Filter coefficients.
  wire [7:0] h0 = 1;
  wire [7:0] h1 = 2;
  wire [7:0] h2 = 3;
  wire [7:0] h3 = 4;

  // Registers to store the past inputs.
  reg [7:0] x_reg1;
  reg [7:0] x_reg2;
  reg [7:0] x_reg3;

  // Intermediate results.
  wire [15:0] p0, p1, p2, p3;
  
  // Multipliers.
  multiplier m0(.a(x), .b(h0), .p(p0));
  multiplier m1(.a(x_reg1), .b(h1), .p(p1));
  multiplier m2(.a(x_reg2), .b(h2), .p(p2));
  multiplier m3(.a(x_reg3), .b(h3), .p(p3));
  
  // Adders.
  wire [15:0] s0, s1;
  
  adder a0(.a(p0), .b(p1), .s(s0));
  adder a1(.a(p2), .b(p3), .s(s1));
  //adder a2(.a(s1), .b(s0), .s(y));
 always @(posedge clk) begin
   y <= s0 + s1;
 end

  // Output calculation.
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      y <= 0;
      x_reg1 <= 0;
      x_reg2 <= 0;
      x_reg3 <= 0;
    end 
    else begin
      x_reg1 <= x;
      x_reg2 <= x_reg1;
      x_reg3 <= x_reg2;
    end
  end

endmodule

////MULTIPLIER////
module multiplier(
input [7:0] a,
input [7:0] b,
output [15:0] p
    );
    
    wire [7:0] q0;
    wire [7:0] q1;
    wire [7:0] q2;
    wire [7:0] q3;
    wire [7:0] q4;
    wire [11:0] q5;
    wire [11:0] q6;
    wire [7:0] temp0;
    wire [11:0] temp1;
    wire [11:0] temp2;
    wire [11:0] temp3;
 
    
    vedic_4bit vd1(a[3:0],b[3:0],q0[7:0]);
    vedic_4bit vd2(a[3:0],b[7:4],q1[7:0]);
    vedic_4bit vd3(a[7:4],b[3:0],q2[7:0]);
    vedic_4bit vd4(a[7:4],b[7:4],q3[7:0]);
    
    assign temp0 = {4'b0,q0[7:4]};
    add_8bit a1(q1[7:0],temp0,q4);
    
    assign temp1 ={4'b0,q2[7:0]};
    assign temp2 ={q3[7:0],4'b0};
    add_12bit a2(temp1,temp2, q5);
    
    assign temp3={4'b0,q4[7:0]};
    add_12bit a3(temp3,q5,q6);
    
    assign p[3:0] = q0[3:0];
    assign p[15:4] = q6[11:0];
    
endmodule


module add_8bit(a,b,sum);
input [7:0] a,b;
output [7:0] sum;

assign sum = a+b;
endmodule


module add_12bit(a,b,sum);
input [11:0] a,b;
output [11:0] sum;

assign sum = a+b;
endmodule


module vedic_4bit(
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


/////adder/////
module adder (
    output [16:0] s,
    input [15:0] a,
    input [15:0] b
);
    wire [15:0] sum;
    wire [15:0] c;
    fa adder1(sum[0], c[0], a[0], b[0], 1'b0);
    fa adder2(sum[1], c[1], a[1], b[1], c[0]);
    fa adder3(sum[2], c[2], a[2], b[2], c[1]);
    fa adder4(sum[3], c[3], a[3], b[3], c[2]);
    fa adder5(sum[4], c[4], a[4], b[4], c[3]);
    fa adder6(sum[5], c[5], a[5], b[5], c[4]);
    fa adder7(sum[6], c[6], a[6], b[6], c[5]);
    fa adder8(sum[7], c[7], a[7], b[7], c[6]);
    fa adder9(sum[8], c[8], a[8], b[8], c[7]);
    fa adder10(sum[9], c[9], a[9], b[9], c[8]);
    fa adder11(sum[10], c[10], a[10], b[10], c[9]);
    fa adder12(sum[11], c[11], a[11], b[11], c[10]);
    fa adder13(sum[12], c[12], a[12], b[12], c[11]);
    fa adder14(sum[13], c[13], a[13], b[13], c[12]);
    fa adder15(sum[14], c[14], a[14], b[14], c[13]);
    fa adder16(sum[15], c[15], a[15], b[15], c[14]);
    assign s = {c[15],sum[15:0]};
endmodule

module fa(
    output sum, carry,
    input a, b, cin
);
    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (cin & a);
endmodule
