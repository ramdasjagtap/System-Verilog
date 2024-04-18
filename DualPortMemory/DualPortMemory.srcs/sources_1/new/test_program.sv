`timescale 1ns / 1ps
`include "bidir_if.sv"

 program automatic  test_program(bidir_if.TB mem);

initial
  begin
   mem.start = 1'b0;
  #20;
   mem.write = 1'b1;
   mem.start = 1'b1;
   mem.addr = 'h0;
   mem.data = 'd0;
 #20;
 mem.write = 1'b1;
 for(int i=0;i<8;i++)
   begin
      mem.addr = i;
      mem.data = $random();
      #20;
   end
   #50;
     mem.start = 1'b0;
     #10;
    mem.start = 1'b1;
   mem.write =1 'b0;
    for(int i=0;i<8;i++)
   begin
      mem.addr = 8-i;
      #20;
   end
   #20;
     mem.start = 1'b0;
     #20;
   $finish();
  end
  
endprogram : test_program;
