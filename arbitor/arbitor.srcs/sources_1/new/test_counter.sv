`timescale 1ns/1ps

module test_counter(
   input logic [2:0] count,
   output bit mode,
   input bit clk,
   output bit arst
	);

	initial begin
	   mode = 1'b1;
	   arst = 1'b1;
	   #20;
	   arst  = 1'b0;
	   #160;
	   arst = 1'b1;
	   #20;
	     mode = 1'b0;
	   arst = 1'b0;
	   #160;
	   $finish();
	end
	
	initial begin
	 repeat (36)
	 @(posedge clk)
	 if( count == 'h7)
	    $display("Maximum count reached - %d",$time);
	  else
	   $display("count value = %d", count);
	  #10;
	  $finish();
	end
endmodule