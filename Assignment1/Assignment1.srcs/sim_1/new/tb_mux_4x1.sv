`timescale 1ns / 1ps

module tb_mux_4x1();
 i_port port_i;
 o_port port_o;
 
 mux_4x1 DUT(.*);

integer file;
initial
  begin
  file = $fopen("mux4x1.txt","w");
  port_i.in0 = 1'b0; port_i.in1 = 1'b0; port_i.in2 = 1'b0; port_i.in3 = 1'b0;
  port_i.sel = 2'b00;
  #10;
   port_i.in0 = 1'b1; port_i.in1 = 1'b0; port_i.in2 = 1'b1; port_i.in3 = 1'b0;
   port_i.sel = 2'b01;
   #10;
     port_i.sel = 2'b10;
    #10;
    port_i.sel = 2'b11;
    #10;
    for(int i=0;i<16;i++)
      begin
        port_i.in0 = $urandom_range(1'b0,1'b1);
        port_i.in1 = $urandom_range(1'b0,1'b1);
        port_i.in2 = $urandom_range(1'b0,1'b1);
        port_i.in3 = $urandom_range(1'b0,1'b1);
        port_i.sel = $urandom_range(2'b00,2'b11);
        #10;
      end
    #30; 
        $display(file, "mux result saved successfully!!");
        $fclose(file);
       $finish();
  end
  

  initial
    begin
    $fmonitor(file," in0 - %b | in1 - %b |in2 - %b | in3 - %b | sel - %b | mux_out - %b",port_i.in0,port_i.in1,port_i.in2,port_i.in3,port_i.sel,port_o.mux_out);
    end
endmodule
