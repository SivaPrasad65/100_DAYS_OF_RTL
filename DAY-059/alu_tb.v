`timescale 1ns / 1ps

module alu_tb;
 wire [7:0] result;
    wire carry_out;
    reg [7:0] operand_a;
    reg [7:0] operand_b;
    reg [3:0] operation;
    ALU uut(result, carry_out, operand_a, operand_b, operation);
    
    initial begin
        operand_a = 8'b00110011; 
        operand_b = 8'b11001100;  
        operation = 4'b0000;      
        #1000 $finish;
        $monitor("operand_a=%b operand_b=%b operation=%b result=%b carry_out=%b", operand_a, operand_b, operation, result, carry_out);
     end

    always begin
        operand_a =$random; 
        operand_b =$random;  
        operation =$random;  
        #50;
    end
endmodule
