`timescale 1ns / 1ps

interface counter_ifc (input bit clk);
logic [2:0] count; 
bit mode;
bit arst;

clocking cb_TB @(posedge clk);
     input count;
     output mode;
  endclocking
 
  clocking cb_M @(posedge clk);
    input count;
    input mode;
  endclocking
  
// mod port for DUT 
 modport CNTR_DUT(
                              output  count,
                              input  mode,arst,clk
  );

// mod port for TB
 modport CNTR_TB( 
                          clocking cb_TB,
                          output  arst
    );

modport MONITOR(
                              clocking cb_M,
                               input arst
);

endinterface
