`timescale 1ns / 1ps

`define TOP $root.top

program automatic test;
bit local_clk;

initial
  forever  #5 top.clk = !top.clk;
 
initial
  begin
  // absolute reference
      $display("clk = %b ", $root.top.clk);
      $display("clk = %b ", `TOP.clk);
      
      // relative reference
      $display("clk = %b ",top.clk);
  end
  
endprogram