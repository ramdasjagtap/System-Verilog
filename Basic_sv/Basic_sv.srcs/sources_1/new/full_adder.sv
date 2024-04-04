`timescale 1ns / 1ps


typedef struct{
  logic [3:0]a,b;
  logic cin;
}addr_ports_in;

typedef struct {
 logic [3:0]sum;
 logic carry;
}addr_ports_out;

module full_adder(
input addr_ports_in fa_in,
output addr_ports_out fa_out
    );
 
    assign {fa_out.carry,fa_out.sum} = fa_in.a + fa_in.b + fa_in.cin;
  
 
endmodule
