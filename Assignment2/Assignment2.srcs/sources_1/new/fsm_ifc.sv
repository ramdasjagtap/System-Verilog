`timescale 1ns / 1ps


interface fsm_ifc(
  input bit clk
 );
    bit arst;
    bit in;
    bit out;
    
    clocking cb_TB @(negedge clk);
     input out;
     output in;
  endclocking
 
    clocking cb_M @( negedge clk);
        input in;
        input out;
     endclocking
     
    modport fsm_DUT(
     input clk,
     input arst,
     input in,
     output out
    );
    
   modport fsm_TB(
     clocking cb_TB,
       output arst
    );
    //   modport fsm_TB(
//     input clk,
//     output arst,
//     output in,
//     input out
//    );
    
    modport fsm_MNTR(
     clocking cb_M,
     input arst
    );
    
//      modport fsm_MNTR(
//     input clk,
//     input arst,
//     input in,
//     input out
//    );
    
endinterface
