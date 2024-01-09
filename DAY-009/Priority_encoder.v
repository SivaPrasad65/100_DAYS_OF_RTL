`timescale 1ns / 1ps

module Priority_encoder(
input [7:0] in,
output reg [2:0] y
    );
   always@(*) 
    begin
        if(in[7]==1) y=3'b111;
        else if(in[6]==1) y=3'b110;
        else if(in[5]==1) y=3'b101;
        else if(in[4]==1) y=3'b100;
        else if(in[3]==1) y=3'b011;
        else if(in[2]==1) y=3'b010;
        else if(in[1]==1) y=3'b001;
        else if(in[0]==1) y=3'b000;
        else y=3'b000;
    end
endmodule
