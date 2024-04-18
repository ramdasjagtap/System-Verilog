`timescale 1ns / 1ps

interface bidir_if();

bit start;
bit write;
logic [2:0] addr;
logic [7:0] data;

// mod port for DUT
modport DUT(
 inout  data,
 input  addr,write, start
 );

// mod port for TB
modport TB(
 inout  data,
 output  addr,write,start
    );

endinterface
