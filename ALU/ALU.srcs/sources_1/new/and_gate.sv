`timescale 1ns / 1ps


module and_gate(
  input logic a,b,enable,
  input bit clk,
  output logic q_out
    );
    
  
    always_ff @(posedge clk)
     begin
      if(enable)
        q_out = a & b;
     end
     
endmodule
