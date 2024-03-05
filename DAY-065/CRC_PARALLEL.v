`timescale 1ns / 1ps


module CRC_PARALLEL(
 input clk, rst, load, d_finish,
    input [7:0] data_in,
    output reg [7:0] crc_out
);

    reg [15:0] crc_register;
    reg [1:0] counter;
    reg [1:0] current_state;
    wire [15:0] next_crc_register;

    parameter IDLE_STATE = 2'b00;
    parameter COMPUTE_STATE = 2'b01;
    parameter FINISH_STATE = 2'b10;

    assign next_crc_register[0] = (^data_in[7:0]) ^ (^crc_register[15:8]);
    assign next_crc_register[1] = (^data_in[6:0]) ^ (^crc_register[15:9]);
    assign next_crc_register[2] = data_in[7] ^ data_in[6] ^ crc_register[9] ^ crc_register[8];
    assign next_crc_register[3] = data_in[6] ^ data_in[5] ^ crc_register[10] ^ crc_register[9];
    assign next_crc_register[4] = data_in[5] ^ data_in[4] ^ crc_register[11] ^ crc_register[10];
    assign next_crc_register[5] = data_in[4] ^ data_in[3] ^ crc_register[12] ^ crc_register[11];
    assign next_crc_register[6] = data_in[3] ^ data_in[2] ^ crc_register[13] ^ crc_register[12];
    assign next_crc_register[7] = data_in[2] ^ data_in[1] ^ crc_register[14] ^ crc_register[13];
    assign next_crc_register[8] = data_in[1] ^ data_in[0] ^ crc_register[15] ^ crc_register[14] ^ crc_register[0];
    assign next_crc_register[9] = data_in[0] ^ crc_register[15] ^ crc_register[1];
    assign next_crc_register[14:10] = crc_register[6:2];
    assign next_crc_register[15] = (^data_in[7:0]) ^ (^crc_register[15:7]);

    always @(posedge clk) begin
        case (current_state)
            IDLE_STATE: begin
                if (load) 
                    current_state <= COMPUTE_STATE;
                else 
                    current_state <= IDLE_STATE;
            end
            COMPUTE_STATE: begin
                if (d_finish) 
                    current_state <= FINISH_STATE;
                else 
                    current_state <= COMPUTE_STATE;
            end
            FINISH_STATE: begin
                if (counter == 2) 
                    current_state <= IDLE_STATE;
                else 
                    current_state <= FINISH_STATE;
            end
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            crc_register[15:0] <= 16'b0;
            current_state <= IDLE_STATE;
            counter <= 2'b0;
        end else begin
            case (current_state)
                IDLE_STATE: begin
                    crc_register[15:0] <= 16'b0;
                end
                COMPUTE_STATE: begin
                    crc_register[15:0] <= next_crc_register[15:0];
                    crc_out[7:0] <= data_in[7:0];
                end
                FINISH_STATE: begin
                    crc_register[15:0] <= {crc_register[7:0], 8'b0};
                    crc_out[7:0] <= crc_register[15:8];
                end
            endcase
        end
    end
endmodule