`timescale 1ns / 1ps

module counter(
input bit clk,
input bit rst,
output logic [3:0] count
    );
    
    `define TOP $root.top
    always_ff @(posedge top.clk)
      begin
       if(top.rst)
         begin
           count <= 'd0;
         end
       else begin
          count <= count + 'd1;
       end
      end
      
endmodule
