`timescale 1ns / 1ps

module carry_select_adder(
input [3:0]a,
    input [3:0] b,
    input c,
    output [4:0]sout,
    output cout
    );
    
    wire [3:0]s1;
    wire [3:0]s2;
    wire [1:0]carry; 
    wire [3:0]sum;   
    wire c1,c2;
    assign carry[0]=0;
    assign carry[1] = 1;
    
    adder_4bit adder_1(a[3:0],b[3:0],carry[0],s1[3:0],c1);
    adder_4bit adder_2(a[3:0],b[3:0],carry[1],s2[3:0],c2);
    
    mux_2x1 mux_1(s1[0],s2[0],c,sum[0]);
    mux_2x1 mux_2(s1[1],s2[1],sum[0],sum[1]);
    mux_2x1 mux_3(s1[2],s2[2],sum[1],sum[2]);
    mux_2x1 mux_4(s1[3],s2[3],sum[2],sum[3]);
    
    mux_2x1 mux_5(c1,c2,sum[3],cout);
    assign sout = {cout,sum[3:0]};
endmodule

module mux_2x1(
    input sum0,sum1,
    input sel,
    output y
    );
    assign y = (sel & sum0) | (~sel& sum1);
    
endmodule

module adder_4bit(
input [3:0] A,B,
input cin,
output [3:0] s1,
output carry);
wire [2:0] c;
full_adder FA1(A[0],B[0],cin,s1[0],c[0]);
full_adder FA2(A[1],B[1],c[0],s1[1],c[1]);
full_adder FA3(A[2],B[2],c[1],s1[2],c[2]);
full_adder FA4(A[3],B[3],c[2],s1[3],carry);

endmodule

module full_adder(
input a,b,c,
output sum,carry);

assign sum = a^b^c;
assign carry= (a&b)|(b&c)|(c&a);
endmodule