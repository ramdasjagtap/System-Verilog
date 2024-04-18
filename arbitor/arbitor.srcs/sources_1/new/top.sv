`timescale 1ns / 1ps
`include "arb_if.sv"

    module top;
    bit clk;
    always #5 clk = ~clk;
   
       arb_if
       arbif (clk);
       
       arb_with_ifc al (arbif.DUT);
       test_with_ifc tl (arbif.TB);
       monitor MONI(arbif.MONITOR);
    
  endmodule: top