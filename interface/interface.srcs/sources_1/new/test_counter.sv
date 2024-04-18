`timescale 1ns/1ps
`include "counter_ifc.sv"

program automatic  test_counter(counter_ifc.CNTR_TB counter);

    initial begin
        counter.cb_TB.mode <= 1'b1;
        counter.arst = 1'b1;
        #20;
        counter.arst = 1'b0;
        #160;
        counter.arst = 1'b1;
        #20;
        counter.cb_TB.mode <= 1'b0;
        counter.arst = 1'b0;
        #160;
        $finish();
    end
    
endprogram : test_counter;
