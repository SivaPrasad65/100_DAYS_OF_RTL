`timescale 1ns / 1ps


module SR_NAND_LATCH(
  input s,r,
    output q,qbar
    );
    nand a1(q,s,qbar);
    nand a2(qbar,r,q);
endmodule
