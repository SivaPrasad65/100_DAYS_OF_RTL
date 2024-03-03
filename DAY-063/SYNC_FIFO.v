`timescale 1ns / 1ps

module SYNC_FIFO(
 input [7:0] data, 
    input clk, reset, rd, wr,
    output empty, full, 
    output reg [3:0]count,
    output reg [7:0] data_out);

    reg [7:0] fifo_ram [0:7];
    reg [2:0] read_ptr, write_ptr;
    assign empty= (count==0);
    assign full =(count==8);
    
    always @(posedge clk) 
        begin
            if (wr && ! full)
                fifo_ram [write_ptr] <= data;
            else if (wr && rd)
                fifo_ram [write_ptr] <= data;
            end

//Read and Write Clock
    always @ (posedge clk) 
        begin
            if (rd && !empty)
                data_out <= fifo_ram [read_ptr];
            else if (rd && wr)
                data_out <= fifo_ram [read_ptr];
        end

//pointer block 
    always @(posedge clk) 
    begin
        if (reset) begin
            write_ptr <= 0;
            read_ptr <= 0;
        end 
        else begin
            write_ptr <= ((wr && ! full) || (wr && rd)) ? write_ptr + 1 : write_ptr;
            read_ptr <= ((rd && !empty) || (wr && rd)) ? read_ptr + 1 : read_ptr;
        end
    end

//counter
    always @(posedge clk) 
        begin
            if (reset) 
                count <= 0;
            else begin
                case ({wr, rd})
                2'b00: count <= count;
                2'b01: count <= (count == 0) ? 0: count - 1;
                2'b10: count <= (count == 8) ? 8: count + 1;
                2'b11 : count <= count;
                default: count <= count;
                endcase
            end
        end
endmodule
