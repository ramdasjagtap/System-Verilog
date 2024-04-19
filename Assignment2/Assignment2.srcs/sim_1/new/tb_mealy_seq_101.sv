`timescale 1ns / 1ps

module tb_mealy_seq_101();
i_port port_i;
o_port port_o;

mealy_seq_101 DUT(.*);

always #5 port_i.clk = ~ port_i.clk;

initial
  begin
 port_i.clk = 1'b0;
  port_i.arst = 1'b1;
  #10;
  port_i.arst = 1'b0;
  
  for(int i=0;i<256;i++)
   begin
    port_i.in = $urandom_range(1'b0,1'b1);
    @(negedge port_i.clk);
   end
   
   #20;
   port_i.arst = 1'b1;
   #20;
   $finish();
  end
  
endmodule
