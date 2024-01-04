`timescale 1ns / 1ps

module or_gate_tb;
reg a,b;
wire y;

Or_gate dut(a,b,y);
initial begin
a=0 ;b=0;
#100;
a=0 ;b=1;
#100;
a=1 ;b=0;
#100;
a=1 ;b=1;
#100;
$finish;
end

endmodule