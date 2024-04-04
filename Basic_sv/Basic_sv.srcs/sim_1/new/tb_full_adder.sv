`timescale 1ns / 1ps

module tb_full_adder();

 addr_ports_in fa_in;
 addr_ports_out fa_out;

full_adder DUT(.*);

initial
  begin
  #10;
   for(int i=0;i<64;i++)
   begin
     {fa_in.a,fa_in.b,fa_in.cin} = i;
     #10;
   end
   $finish();
  end
  
endmodule
