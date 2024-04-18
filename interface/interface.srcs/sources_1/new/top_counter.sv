`timescale 1ns / 1ps
`include "counter_ifc.sv"

module top_counter;
bit clk;

always #5 clk = ~clk;

counter_ifc
 counter (clk);

test_counter TC(counter);
up_down_counter UDC(counter);
monitor MONI(counter);

endmodule:top_counter