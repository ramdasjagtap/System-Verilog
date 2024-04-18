`timescale 1ns / 1ps

typedef struct {
 logic in0;
 logic in1;
 logic in2;
 logic in3;
 logic [1:0]sel;
}i_port;

typedef struct{
 logic mux_out;
}o_port;

module mux_4x1(
 input i_port port_i,
 output o_port port_o
    );
    always_comb
      begin
        case(port_i.sel)
        2'b00: port_o.mux_out = port_i.in0;
        2'b01: port_o.mux_out = port_i.in1;
        2'b10: port_o.mux_out = port_i.in2;
        2'b11: port_o.mux_out = port_i.in3;
        default: port_o.mux_out  = 'hz;
        endcase
      end
      
endmodule
