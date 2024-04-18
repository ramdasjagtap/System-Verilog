`timescale 1ns / 1ps

module top_sv();
logic [1:0] grant, request;
bit clk;

always #50 clk = ~clk;
arb_with_port a1 (grant, request, rst, clk);
test_port_arb_design t1 (grant, request, rst, clk);

endmodule