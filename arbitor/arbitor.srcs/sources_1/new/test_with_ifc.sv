`timescale 1ns / 1ps
`include "arb_if.sv"

program automatic test_with_ifc (arb_if.TB arbif);

initial begin
       @ arbif.cb_TB;
        arbif.cb_TB.request <= 2'b01;
        $display("%d: Drove request =2'b01" , $time);
       repeat (2) @ arbif.cb_TB;
        if (arbif.cb_TB.grant == 2'b01)
           $display("%d:  grant = 2'b01   " , $time);
        else
         $display("%d: Error! ",$time);
    $finish();
end

endprogram : test_with_ifc;