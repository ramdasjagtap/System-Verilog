`timescale 1ns / 1ps
`include "bidir_if.sv"

module memory(bidir_if.DUT  mem);

logic [7:0] RAM [0:7];
logic [7:0]temp;

always @(*)
  begin
   if(mem.write == 1'b1)
     begin
       RAM[mem.addr] = mem.data;   
     end
  else begin
     temp = RAM[mem.addr];
  end
  end
 
 assign mem.data = !mem.write? temp : 'hz;
 
endmodule
