`timescale 1ns / 1ps
`include "mux_ifc.sv"

program automatic  tb_mux4x1 (mux_ifc.MUX_TB MUX);

initial
  begin
    MUX.sel = 2'b00;
    MUX.in0 = 1'b0 ;  MUX.in1 = 1'b0 ;  MUX.in2 = 1'b0 ;  MUX.in3 = 1'b0 ; 
    #20;
    for(int i=0;i<16;i++)
      begin
           MUX.in0 = $urandom_range(1'b0,1'b1);
           MUX.in1 =$urandom_range(1'b0,1'b1);  
           MUX.in2 =$urandom_range(1'b0,1'b1);  
           MUX.in3 = $urandom_range(1'b0,1'b1);
           MUX.sel = $urandom_range(2'b00,2'b11);
           #10;
      end
  end

endprogram :  tb_mux4x1;