`timescale 1ns/1ps
`include "counter_ifc.sv"

module up_down_counter( counter_ifc.CNTR_DUT counter);

always_ff @(posedge counter.clk or posedge counter.arst )
  begin
  if(counter.arst )
      begin
      counter. count <= 'd0;
     end
  else if(counter.mode) begin
    counter. count <= counter. count + 'd1;
  end
 end

 always_ff @(posedge  counter.clk  or posedge counter.arst  )
  begin
  if(counter.arst )
      begin
       counter. count <= 'd7;
     end
  else if(!counter.mode) begin
    counter. count <= counter. count  -  'd1;
  end
 end
 
 endmodule