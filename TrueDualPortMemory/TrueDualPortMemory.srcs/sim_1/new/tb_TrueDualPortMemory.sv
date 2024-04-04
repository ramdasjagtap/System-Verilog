`timescale 1ns / 1ps

module tb_TrueDualPortMemory( );

  i_port port1_in;
  i_port  port2_in;
  o_port port1_out;
  o_port port2_out;
  
  // module instance
TrueDualPortMeory DUT(.*);

//port 1 clk
 always #5 port1_in.clk_write = ! port1_in.clk_write;
 always #10 port1_in.clk_read = ! port1_in.clk_read;

//port 2 clk
 always #5 port2_in.clk_write = ! port2_in.clk_write;
 always #10 port2_in.clk_read = ! port2_in.clk_read;
 
 initial
   begin
     port1_in.clk_write = 1'b0;
     port2_in.clk_write = 1'b0;
     port1_in.clk_read = 1'b0;
     port2_in.clk_read = 1'b0;
     
     port1_in.data_out_en =  1'b0;
     port2_in.data_out_en =  1'b0;
     
     port1_in.cs = 1'b1;
     port2_in.cs = 1'b1;
     #10;
     // writing data into memory
      port1_in.RW = 1'b0;
      port2_in.RW = 1'b0;
     for(int  i=0;i<1024;i++)
      begin
        port1_in.data_in = $random();
        port2_in.data_in = $random();
        port1_in.address = i;
        port2_in.address = 1024-i;
        #10;
      end
      port1_in.data_out_en =  1'b1;
      port2_in.data_out_en =  1'b1;
      #10;
      
      // Reading from memory
       port1_in.RW = 1'b1;
      port2_in.RW = 1'b1;
     for(int  i=0;i<1024;i++)
      begin
        port1_in.address = i;
        port2_in.address = 1024-i;
        #10;
      end
 #10;
 $finish();
   end
   
endmodule
