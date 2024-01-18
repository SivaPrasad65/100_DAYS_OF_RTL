`timescale 1ns / 1ps

module carr_skip_adder_st(
input [3:0] a,b,
input cin,
output [3:0]sum,
output cout
    );
    wire [3:0] p;
    wire c0;
    wire bp;
    
    
   parallel_adder p1(a,b,cin,sum,c0);
   propagate pg(a,b,p,bp);
   mux m1(cin,c0,bp,cout);
    
endmodule

module propagate(
input [3:0] a,
input [3:0] b,
output [3:0] p,
output bp);
 
 xor_gate x4(a,b,p);
 assign bp=&p;

endmodule

module mux(
input a,b,sel,
output y
);
assign y = sel?b:a;
endmodule

module parallel_adder(
input [3:0] A,B,
input cin,
output [4:0] sum,
output carry);
wire [2:0] c;
wire [3:0] s1;
full_adder FA1(A[0],B[0],cin,s1[0],c[0]);
full_adder FA2(A[1],B[1],c[0],s1[1],c[1]);
full_adder FA3(A[2],B[2],c[1],s1[2],c[2]);
full_adder FA4(A[3],B[3],c[2],s1[3],carry);
assign sum={carry,s1[3:0]};

endmodule


module full_adder(
input a,b,c,
output sum,carry);

wire x1,x2,x3,x4,x5;

and_gate a1(a,b,x1);
and_gate a2(b,c,x2);
and_gate a3(c,a,x3);
xor_gate xor1(a,b,x5);
xor_gate xor2(x5,c,sum);
or_gate or1(x1,x2,x4);
or_gate or2(x4,x2,carry);

endmodule

module and_gate(
input a,b,
output c);

and (c,a,b);
endmodule

module or_gate(
input a,b,
output c);

or (c,a,b);
endmodule

module xor_gate(
input a,b,
output c);

xor (c,a,b);
endmodule
