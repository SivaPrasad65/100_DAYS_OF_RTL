`timescale 1ns / 1ps

module DADDA_Multiplier(
input [7:0] A,B,
    output [15:0] y);
    wire  gen_pp [0:7][7:0];
    wire [0:5]s1,c1;
    wire [0:13]s2,c2;   
    wire [0:9]s3,c3;
    wire [0:11]s4,c4;
    wire [0:13]c5;

    genvar i;
    genvar j;
    
    for(i = 0; i<8; i=i+1)begin
       for(j = 0; j<8;j = j+1)begin
          assign gen_pp[i][j] = A[j]*B[i];
        end
    end

//Stage 1 
    HA h1((gen_pp[6][0]),(gen_pp[5][1]),(s1[0]),(c1[0]));
    HA h2((gen_pp[4][3]),(gen_pp[3][4]),(s1[2]),(c1[2]));
    HA h3((gen_pp[4][4]),(gen_pp[3][5]),(s1[4]),(c1[4]));

    adder c11((gen_pp[7][0]),(gen_pp[6][1]),(gen_pp[5][2]),(s1[1]),(c1[1]));
    adder c12((gen_pp[7][1]),(gen_pp[6][2]),(gen_pp[5][3]),(s1[3]),(c1[3]));     
    adder c13((gen_pp[7][2]),(gen_pp[6][3]),(gen_pp[5][4]),(s1[5]),(c1[5]));
    
//Stage 2 
    HA h4((gen_pp[4][0]),(gen_pp[3][1]),(s2[0]),(c2[0]));
    HA h5((gen_pp[2][3]),(gen_pp[1][4]),(s2[2]),(c2[2]));

    adder c21((gen_pp[5][0]),(gen_pp[4][1]),(gen_pp[3][2]),(s2[1]),(c2[1]));
    adder c22((s1[0]),(gen_pp[4][2]),(gen_pp[3][3]),(s2[3]),(c2[3]));
    adder c23((gen_pp[2][4]),(gen_pp[1][5]),(gen_pp[0][6]),(s2[4]),(c2[4]));
    adder c24((s1[1]),(s1[2]),(c1[0]),(s2[5]),(c2[5]));
    adder c25((gen_pp[2][5]),(gen_pp[1][6]),(gen_pp[0][7]),(s2[6]),(c2[6]));
    adder c26((s1[3]),(s1[4]),(c1[1]),(s2[7]),(c2[7]));
    adder c27((c1[2]),(gen_pp[2][6]),(gen_pp[1][7]),(s2[8]),(c2[8]));
    adder c28((s1[5]),(c1[3]),(c1[4]),(s2[9]),(c2[9]));
    adder c29((gen_pp[4][5]),(gen_pp[3][6]),(gen_pp[2][7]),(s2[10]),(c2[10]));
    adder c210((gen_pp[7][3]),(c1[5]),(gen_pp[6][4]),(s2[11]),(c2[11]));
    adder c211((gen_pp[5][5]),(gen_pp[4][6]),(gen_pp[3][7]),(s2[12]),(c2[12]));
    adder c212((gen_pp[7][4]),(gen_pp[6][5]),(gen_pp[5][6]),(s2[13]),(c2[13]));
    
//Stage 3 

    HA h6((gen_pp[3][0]),(gen_pp[2][1]),(s3[0]),(c3[0]));

    adder c31((s2[0]),(gen_pp[2][2]),(gen_pp[1][3]),(s3[1]),(c3[1]));
    adder c32((s2[1]),(s2[2]),(c2[0]),(s3[2]),(c3[2]));
    adder c33((c2[1]),(c2[2]),(s2[3]),(s3[3]),(c3[3]));
    adder c34((c2[3]),(c2[4]),(s2[5]),(s3[4]),(c3[4]));
    adder c35((c2[5]),(c2[6]),(s2[7]),(s3[5]),(c3[5]));
    adder c36((c2[7]),(c2[8]),(s2[9]),(s3[6]),(c3[6]));
    adder c37((c2[9]),(c2[10]),(s2[11]),(s3[7]),(c3[7]));
    adder c38((c2[11]),(c2[12]),(s2[13]),(s3[8]),(c3[8]));
    adder c39((gen_pp[7][5]),(gen_pp[6][6]),(gen_pp[5][7]),(s3[9]),(c3[9]));

//Stage 4 

    HA h7((gen_pp[2][0]),(gen_pp[1][1]),(s4[0]),(c4[0]));

    adder c41((s3[0]),(gen_pp[1][2]),(gen_pp[0][3]),(s4[1]),(c4[1]));
    adder c42((c3[0]),(s3[1]),(gen_pp[0][4]),(s4[2]),(c4[2]));
    adder c43((c3[1]),(s3[2]),(gen_pp[0][5]),(s4[3]),(c4[3]));
    adder c44((c3[2]),(s3[3]),(s2[4]),(s4[4]),(c4[4]));
    adder c45((c3[3]),(s3[4]),(s2[6]),(s4[5]),(c4[5]));
    adder c46((c3[4]),(s3[5]),(s2[8]),(s4[6]),(c4[6]));
    adder c47((c3[5]),(s3[6]),(s2[10]),(s4[7]),(c4[7]));
    adder c48((c3[6]),(s3[7]),(s2[12]),(s4[8]),(c4[8]));
    adder c49((c3[7]),(s3[8]),(gen_pp[4][7]),(s4[9]),(c4[9]));
    adder c410((c3[8]),(s3[9]),(c2[13]),(s4[10]),(c4[10]));
    adder c411((c3[9]),(gen_pp[7][6]),(gen_pp[6][7]),(s4[11]),(c4[11]));
    
//Stage 5 
    HA h8(.a(gen_pp[1][0]),.b(gen_pp[0][1]),.Sum(y[1]),.Cout(c5[0]));

    adder c51((s4[0]),(gen_pp[0][2]),(c5[0]),(y[2]),(c5[1]));
    adder c52((c4[0]),(s4[1]),(c5[1]),(y[3]),(c5[2]));
    adder c54((c4[1]),(s4[2]),(c5[2]),(y[4]),(c5[3]));
    adder c55((c4[2]),(s4[3]),(c5[3]),(y[5]),(c5[4]));
    adder c56((c4[3]),(s4[4]),(c5[4]),(y[6]),(c5[5]));
    adder c57((c4[4]),(s4[5]),(c5[5]),(y[7]),(c5[6]));
    adder c58((c4[5]),(s4[6]),(c5[6]),(y[8]),(c5[7]));
    adder c59((c4[6]),(s4[7]),(c5[7]),(y[9]),(c5[8]));
    adder c510((c4[7]),(s4[8]),(c5[8]),(y[10]),(c5[9]));
    adder c511((c4[8]),(s4[9]),(c5[9]),(y[11]),(c5[10]));
    adder c512((c4[9]),(s4[10]),(c5[10]),(y[12]),(c5[11]));
    adder c513((c4[10]),(s4[11]),(c5[11]),(y[13]),(c5[12]));
    adder c514((c4[11]),(gen_pp[7][7]),(c5[12]),(y[14]),(c5[13]));

    assign y[0] =  gen_pp[0][0];
    assign y[15] = c5[13];
    
endmodule 

module adder(
    input A,B,Cin,
    output Y,Cout);
        
    assign Y = A^B^Cin;
    assign Cout = (A&B)|(A&Cin)|(B&Cin);
    
endmodule

module HA (
     input a, b,
     output Sum, Cout);

     assign Sum = a ^ b;
     assign Cout = a & b;
endmodule