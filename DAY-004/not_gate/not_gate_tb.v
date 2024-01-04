`timescale 1ns / 1ps

module not_gate_tb;
reg a;
wire y;

Not_mux dut(a,y);
initial begin
a=0 ;
#100;
a=1 ;
#100;

$finish;
end

endmodule