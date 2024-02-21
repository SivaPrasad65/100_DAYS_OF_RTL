`timescale 1ns / 1ps

module Moore_overlapping(
input din,clk,reset,
    output reg dout
    );

    reg [2:0] current_state,next_state;
	 
    parameter s0= 3'b000;
    parameter s1= 3'b001;
    parameter s2= 3'b010;
    parameter s3= 3'b011;
    parameter s4= 3'b100;

    always@(posedge clk)
    begin
      if(reset==1) 
        begin
            current_state <= s0;
        end
      else
        begin
            current_state <= next_state;
        end
      end
    
    always@(din or current_state)
    begin
        case(current_state)
        s0: if(din==1) begin
            next_state = s1;
            dout = 1'b0; end
            else begin
            next_state = current_state;
            dout = 1'b0; end
            
        s1: if(din==0) begin
            next_state = s2;
            dout = 1'b0; end
            else begin
            next_state = current_state;
            dout = 1'b0; end	 
             
        s2: if(din==0) begin
            next_state = s3;
            dout = 1'b0; end
            else begin
            next_state = s1;
            dout = 1'b0; end
        
        s3: if(din==1) begin
            next_state = s4;
            dout = 1'b0; end
            else begin
            next_state = s0;
            dout = 1'b0; end
             
        s4: if(din==1) begin
            next_state = s1;
            dout = 1'b1; end
            else begin
            next_state = s0;
            dout = 1'b1; end	 
             
        default: next_state = s0;
        endcase
    end

endmodule      
