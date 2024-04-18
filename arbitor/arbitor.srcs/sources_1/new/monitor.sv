`timescale 1ns / 1ps
`include "arb_if.sv"

module monitor (arb_if. MONITOR arbif) ;
      always @(posedge arbif.cb_M.request[0])
        begin 
            $display ("%d: request[0] asserted", $time);
        @(posedge arbif.cb_M.grant [0]);
          $display ("%d: grant[0] asserted", $time);
       end
always @(posedge arbif.cb_M.request [1]) 
 begin
        $display("%d: request[1] asserted", $time);
         @(posedge arbif.cb_M.grant [1]);
        $display("%d: grant [1] asserted", $time);
 end
 
endmodule
