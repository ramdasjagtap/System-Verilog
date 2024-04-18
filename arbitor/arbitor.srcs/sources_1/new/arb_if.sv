`timescale 1ns / 1ps

//interface arbitor
interface arb_if (input bit clk);
logic [1:0] grant, request; 
bit rst;

// clocking block
 clocking cb_TB @(posedge clk);
     input grant;
     output request;
  endclocking

clocking cb_M @(posedge clk);
    input grant;
    input request;
endclocking

// mod port for DUT
modport DUT(
  input clk,rst,request,
 output grant );

// mod port for TB
modport TB(
    output rst,
    clocking cb_TB);

// monitor block
modport MONITOR(
  input rst,
  clocking cb_M
  );
endinterface