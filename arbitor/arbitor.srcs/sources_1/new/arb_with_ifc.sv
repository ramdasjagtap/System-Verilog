`timescale 1ns / 1ps
`include "arb_if.sv"

module arb_with_ifc (arb_if.DUT arbif);

always @(posedge arbif.clk or posedge arbif.rst)
begin
    if (arbif.rst)
    begin
        arbif.grant <= 'b0;
    end
    else if (arbif.request [0]) // High priority
      begin
           arbif.grant <= 2'b01;
      end
    else if (arbif.request [1]) // Low priority
     begin
               arbif.grant <= 2'b10;
     end
    else begin
     arbif.grant <= '0 ;
    end
end

endmodule