`timescale 1ns / 1ps

interface interface_ex (input bit clk);
logic [2:0] count; 
bit mode;
bit arst;

// mod port for DUT
modport DUT(
 output  count,
 input  mode,
 input  clk,
 input  arst
 );

// mod port for TB
modport TB(
 input   count,
 input clk,
 output  mode,
 output  arst
    );

endinterface