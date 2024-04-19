`timescale 1ns / 1ps


interface fsm_ifc(
  input bit clk
 );
    bit arst;
    bit in;
    bit out;
    
    modport fsm_DUT(
     input clk,
     input arst,
     input in,
     output out
    );
    
   modport fsm_TB(
     input clk,
     output arst,
     output in,
     input out
    );
    
    modport fsm_MNTR(
     input clk,
     input arst,
     input in,
     input out
    );
    
endinterface
