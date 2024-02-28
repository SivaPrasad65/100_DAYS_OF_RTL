`timescale 1ns / 1ps

module ALU(
    output [7:0] result,
    output carry_out,
    input [7:0] operand_a,
    input [7:0] operand_b,
    input [3:0] operation
);
    reg [7:0] ALU_Result;
    wire [8:0] extended_result;
    assign result = ALU_Result;    
    assign extended_result = {1'b0, operand_a} + {1'b0, operand_b};
    assign carry_out = extended_result[8];  

    always @(*)
    begin
        case (operation)
         // Arithmetic operations
         4'b0000: ALU_Result = operand_a + operand_b;                 // Addition
         4'b0001: ALU_Result = operand_a - operand_b;                 // Subtraction
         4'b0010: ALU_Result = operand_a * operand_b;                 // Multiplication
         4'b0011: ALU_Result = operand_a / operand_b;                 // Division
         // Bitwise operations
         4'b0100: ALU_Result = operand_a << 1;                        // Logical shift left
         4'b0101: ALU_Result = operand_a >> 1;                        // Logical shift right
         4'b0110: ALU_Result = {operand_a[6:0], operand_a[7]};        // Rotate left
         4'b0111: ALU_Result = {operand_a[0], operand_a[7:1]};        // Rotate right
         // Logical operations
         4'b1000: ALU_Result = operand_a & operand_b;                  // Logical AND
         4'b1001: ALU_Result = operand_a | operand_b;                  // Logical OR
         4'b1010: ALU_Result = operand_a ^ operand_b;                  // Logical XOR
         4'b1011: ALU_Result = ~(operand_a | operand_b);               // Logical NOR
         4'b1100: ALU_Result = ~(operand_a & operand_b);               // Logical NAND
         4'b1101: ALU_Result = ~(operand_a ^ operand_b);               // Logical XNOR
         // Comparison operations
         4'b1110: ALU_Result = (operand_a > operand_b) ? 8'd1 : 8'd0;    // Greater comparison
         4'b1111: ALU_Result = (operand_a == operand_b) ? 8'd1 : 8'd0;   // Equal comparison
         default: ALU_Result = operand_a + operand_b;                    // Addition (default case)
        endcase
    end
endmodule
