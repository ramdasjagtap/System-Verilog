`timescale 1ns / 1ps


module flipflop(
 input bit clk,rst,
 input logic d,
 output logic q
    );
    
    always_ff@(posedge clk)
      begin
       if(rst)
         q <= 'd0;
       else
         q <= d;
      end
      
endmodule
