`timescale 1ns / 1ps
`include "mux_ifc.sv"

module mux_monitor(mux_ifc.MUX_MNTR MUX);

initial 
   begin
    $monitor("time - %d | in0 - %b | in1 - %b |in2 - %b | in3 - %b | sel - %b | mux_out - %b",$time,MUX.in0,MUX.in1,MUX.in2,MUX.in3,MUX.sel,MUX.mux_out);
   end

initial 
   begin
     if((MUX.sel == 2'b00) && (MUX.mux_out  != MUX.in0))
        begin
           $display("------------------------ ERROR ------------------------ ");
        end
     else begin
          $display("------------------------  Working perfectly ------------------------");
     end
   end
endmodule
