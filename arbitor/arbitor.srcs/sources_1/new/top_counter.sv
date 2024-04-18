`timescale 1ns / 1ps


module top_counter();
bit mode;
bit clk;
bit arst;
logic [2:0] count;

always #5 clk = ~clk;

test_counter TC(count,mode,clk,arst);
up_down_counter UDC(count,mode,clk,arst);

endmodule
