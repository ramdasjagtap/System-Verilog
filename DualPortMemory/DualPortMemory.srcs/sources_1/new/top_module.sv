`timescale 1ns / 1ps
//`timescale 1ns / 1ps
`include "bidir_if.sv"

module top_module();

bidir_if mem();
memory DUT(mem.DUT);
//tb_memory TB(mem.TB);
test_program TB(mem.TB);

endmodule
