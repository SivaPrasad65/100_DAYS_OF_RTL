`timescale 1ns / 1ps

 module up_down_counter(
    clk,
    reset,
    upOrDown, 
    Count
    );
    input clk,reset,upOrDown;
    output [3 : 0] Count;
    reg [3 : 0] Count = 0;  
    
     always @(posedge(clk) or posedge(reset))
     begin
        if(reset == 1) 
            Count <= 0;
        else    
            if(upOrDown == 1)   
                if(Count == 15)
                    Count <= 0;
                else
                    Count <= Count + 1; 
            else  
                if(Count == 0)
                    Count <= 15;
                else
                    Count <= Count - 1; 
     end    
    
endmodule