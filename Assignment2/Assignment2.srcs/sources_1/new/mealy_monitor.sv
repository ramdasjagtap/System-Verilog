`timescale 1ns / 1ps
`include  "fsm_ifc.sv"

module mealy_monitor(fsm_ifc.fsm_MNTR FSM);

initial
  begin
   $monitor("time = %d | arst = %b | in = %b | out = %b  ",$time,FSM.arst,FSM.cb_M.in,FSM.cb_M.out);
  end
  
 initial
  begin
      if(FSM.cb_M.out == 1'b1)
      $display("--- seq 101 DETECTED !! ---");
  else
     $display ("--- seq 101 NOT DETECTED !! ---");
  end
  
endmodule
