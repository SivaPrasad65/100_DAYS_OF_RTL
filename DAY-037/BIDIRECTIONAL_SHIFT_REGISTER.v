`timescale 1ns / 1ps

module BIDIRECTIONAL_SHIFT_REGISTER(
    input clk, rst, enable, mode, din,
    output reg [3:0] q
);

    always @(posedge clk) begin
        if (rst)
            q <= 4'b0000;
        else begin
            if (enable) begin
                case(mode)
                    0: q <= {q[2:0], din};
                    1: q <= {din, q[3:1]};
                    default: q <= q;
                endcase
            end else begin
                q <= q;
            end
        end
    end

endmodule

