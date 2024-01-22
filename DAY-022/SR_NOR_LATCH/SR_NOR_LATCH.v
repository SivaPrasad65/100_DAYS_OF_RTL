`timescale 1ns / 1ps

module SR_NOR_LATCH(
 input s,r,
    output q,qbar
    );
    nor a1(q,r,qbar);
    nor a2(qbar,s,q);
endmodule