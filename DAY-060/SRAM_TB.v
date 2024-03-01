`timescale 1ns / 1ps

module SRAM_TB;
parameter addr_width = 6,data_width=8,depth=64,setup = 1, hold=1, TP =10;
 reg clk,rst,wr;
 reg [addr_width-1:0] addr;
 reg [data_width-1:0] data;
 wire[data_width-1:0] Rout;
 
  reg [data_width-1:0]mem[0:depth-1];
  reg [data_width-1:0] Rout_exp;
  integer i;
 SRAM dut(clk,rst,wr,addr,data,Rout);
 initial begin
 clk=0;
 forever #(TP/2) clk=~clk;
 end
 
 initial 
begin

write_stimuli(1'b0, 1'b0, 6'bx, 8'bx);
for(i=1; i<depth; i=i+1)
begin
write_stimuli(1'b1, 1'b0, i, $random);
//read_stimuli(1'b1, 1'b1, addr);
end

begin
for (i = depth-1; i >= 1; i = i - 1) begin
        read_stimuli(1'b1, 1'b1, i);
    end
end
end

  task write_stimuli;
  input rst_t,wr_t;
  input [addr_width-1:0] addr_t;
  input [data_width-1:0] data_t;
  
  begin
  #((TP/2)-setup);
   rst = rst_t;
   wr = wr_t;
   addr = addr_t;
   data = data_t;
   @(posedge clk)
   mem[addr_t] = data_t;
   #(hold);
   rst=1'b0;
   wr = 1'bx;
   //addr = 4'bx;
   data=8'bx;
   #((TP/2)-setup)
    $display("Writing Done");
  end
 endtask
 
 task read_stimuli;
  input rst_t,wr_t;
  input [addr_width-1:0] addr_t;
  
  begin
  #((TP/2)-setup);
   rst = rst_t;
   wr = wr_t;
   addr = addr_t;
   @(posedge clk)
    Rout_exp = mem[addr_t];
   #(hold);
   rst=1'b0;
   wr = 1'bx;
   //addr = 4'bx;
   #((TP/2)-setup);
  
if(Rout==Rout_exp)
   $display (" match %0d addr_t=%0d ,Rout=%0d, Rout_exp=%0d", $time, addr_t ,Rout, Rout_exp);
else
   $display (" not match %0d   Rout=%0d, Rout_exp=%0d",$time, Rout, Rout_exp);

  end
 endtask
endmodule

