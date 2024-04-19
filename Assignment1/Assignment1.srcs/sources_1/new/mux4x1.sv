`timescale 1ns / 1ps
`include "mux_ifc.sv"

module mux4x1(mux_ifc.MUX_DUT MUX);

 always_comb
   begin
     case(MUX.sel)
     2'b00: MUX.mux_out = MUX.in0;
     2'b01: MUX.mux_out = MUX.in1;
     2'b10: MUX.mux_out = MUX.in2;
     2'b11: MUX.mux_out = MUX.in3;
     default: MUX.mux_out = 'hz;
     endcase
   end
   
endmodule
