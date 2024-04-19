`timescale 1ns / 1ps
`include "fsm_ifc.sv"

module top_mealy_101();

bit clk;
always #5 clk = ~clk;

fsm_ifc fsm (clk);
mealy_101_DUT DUT(fsm);
mealy_101_TB TB(fsm);
mealy_monitor MNTR(fsm);

endmodule
