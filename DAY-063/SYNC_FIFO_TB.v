module tsetbench;

    reg clk, reset, rd, wr;
    reg [7:0] data;
    wire empty, full;
    wire [3:0] count;
    wire [7:0] data_out;

    SYNC_FIFO my_fifo (
        .data(data),
        .clk(clk),
        .reset(reset),
        .rd(rd),
        .wr(wr),
        .empty(empty),
        .full(full),
        .count(count),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        reset = 1;
        rd = 0;
        wr = 0;
        data = 8'b0;
        #15 reset = 0;
        wr = 1;
        data = 8'b10101010;
        #10 wr = 0;
        rd = 1;
        #10 rd = 0;
        wr = 1;
        data = 8'b11001100;
        #10 wr = 0;
        rd = 1;
        #10 rd = 0;
        #10 $stop;
    end

    always #5 clk = ~clk;

endmodule