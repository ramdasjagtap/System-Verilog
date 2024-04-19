`timescale 1ns / 1ps
`include "mux_ifc.sv"

module top_mux4x1();
mux_ifc MUX();

mux4x1 MUX_DUT(MUX);
//test_mux MUX_TB(MUX);
tb_mux4x1 MUX_TB(MUX);
mux_monitor MUX_MNTR(MUX);

endmodule
