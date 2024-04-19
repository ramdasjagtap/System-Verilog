`timescale 1ns / 1ps
`include  "fsm_ifc.sv"

module mealy_monitor(fsm_ifc.fsm_MNTR FSM);

initial
  begin
   $monitor("time = %d | arst = %b | in = %b | out = %b  ",$time,FSM.arst,FSM.in,FSM.out);
  end
  
 initial
  begin
  repeat (50) @(FSM.clk);
   begin
      if(FSM.out == 1'b1)
      $display("--- seq 101 DETECTED !! ---");
  else
     $display ("--- seq 101 NOT DETECTED !! ---");
   end
  end
  
endmodule
