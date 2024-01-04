`timescale 1ns / 1ps

module and_mux_tb;
reg a,b;
wire y;

and_mux dut(a,b,y);
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
