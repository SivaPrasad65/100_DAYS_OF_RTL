module clock_divider_tb;

reg clk, rst;
wire divby2, divby4, divby8, divby16;

Clock_divider dut(clk, rst, divby2, divby4, divby8, divby16);

initial begin
    clk = 0;
    rst = 0;
    #10;
    rst = 1;
    forever #10 clk = ~clk;
    #100 $finish;
end

endmodule


