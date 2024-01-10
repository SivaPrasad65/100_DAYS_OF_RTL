`timescale 1ns / 1ps


module decoder_3x8_tb;
 wire [7:0] y;
 reg [2:0] i;
 Decoder_3x8 dut(y,i);
    initial begin
    i=3'b000;
    #800 $finish();
    end
    always #100 i[0]=~i[0];
    always #200 i[1]=~i[1];
    always #400 i[2]=~i[2];
endmodule
