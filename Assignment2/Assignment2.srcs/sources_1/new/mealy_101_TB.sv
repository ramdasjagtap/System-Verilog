`timescale 1ns / 1ps
`include "fsm_ifc.sv"

program automatic mealy_101_TB(fsm_ifc.fsm_TB FSM);

initial
  begin
   FSM.arst = 1'b1;
   @ (posedge FSM.clk);
   @ (posedge FSM.clk);
   FSM.arst = 1'b0;
   
   for(int i=0;i<256;i++)
     begin
     FSM.in = $urandom_range(1'b0,1'b1);
     @(negedge FSM.clk);
     end
     
     #20;
     $finish();
  end

endprogram : mealy_101_TB;
