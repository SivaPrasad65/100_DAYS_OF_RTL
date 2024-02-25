`timescale 1ns / 1ps


module Round_Robin_Arbiter(
input clk, rst,
		input [3:0] request,
		output reg [3:0] grant
		);

	reg [2:0] present_state, next_state;
  
	parameter [2:0] ideal = 3'b000;
	parameter [2:0] s0 = 3'b001;
	parameter [2:0] s1 = 3'b010;
	parameter [2:0] s2 = 3'b011;
	parameter [2:0] s3 = 3'b100;

  always @ (posedge clk or posedge rst)
		begin
         if(rst)
			present_state <= ideal;
		 else
			present_state <= next_state;
		end
  always @(*) 
		begin
			case(present_state)
				ideal : begin
							if(request[0]) next_state = s0;
							else if(request[1]) next_state = s1;
							else if(request[2]) next_state = s2;
							else if(request[3])	next_state = s3;
							else next_state = ideal;		
						end 
				s0 : begin
							if(request[1])next_state = s1;
							else if(request[2])next_state = s2;
							else if(request[3])next_state = s3;
							else if(request[0])next_state = s0;
							else next_state = ideal;
						end 
				s1 : begin
							if(request[2]) next_state = s2;
							else if(request[3]) next_state = s3;
							else if(request[0]) next_state = s0;
							else if(request[1]) next_state = s1;
							else next_state = ideal;
						end 
				s2 : begin
							if(request[3]) next_state = s3;
							else if(request[0]) next_state = s0;
							else if(request[1]) next_state = s1;
							else if(request[2]) next_state = s2;
							else next_state = ideal;
						end 
				s3 : begin
							if(request[0]) next_state = s0;
							else if(request[1]) next_state = s1;
							else if(request[2]) next_state = s2;
							else if(request[3]) next_state = s3;
							else next_state = ideal;
						end 
				default : begin
							if(request[0]) next_state = s0;
							else if(request[1]) next_state = s1;
							else if(request[2]) next_state = s2;
							else if(request[3]) next_state = s3;
							else next_state = ideal;
						end 
			endcase 
	 end

  always @(*) 
		begin
          case(present_state)
				s0 : begin grant = 4'b0001; end
				s1 : begin grant = 4'b0010; end
				s2 : begin grant = 4'b0100; end
				s3 : begin grant = 4'b1000; end
			default : begin grant = 4'b0000; end
		  endcase
		end
endmodule 