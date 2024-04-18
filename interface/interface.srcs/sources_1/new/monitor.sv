`timescale 1ns / 1ps
`include "counter_ifc.sv"

module monitor(counter_ifc.MONITOR counter);
always @(posedge counter.cb_M.mode)
  begin
    $display("------------------------ Up counter ------------------------");
  end
  
always @(negedge  counter.cb_M.mode)
  begin
    $display("------------------------ Down counter ------------------------");
  end
  
always @(posedge counter.arst)
 begin
  $display("Asynchronous reset is asserted!!");
 end

 always @(negedge counter.arst)
  begin
    $display("Asynchronous reset is desserted!!");
  end
  
 always @ (counter.cb_M)
   begin
      $display("counter value - %d ",counter.cb_M.count);
   end
   
endmodule
