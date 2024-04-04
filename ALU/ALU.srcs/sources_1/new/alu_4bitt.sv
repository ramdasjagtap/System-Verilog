`timescale 1ns / 1ps


typedef struct {
 logic [3:0]a_in,b_in;
 logic c_in;
}alu_in;

typedef enum bit [1:0] {ADD,SUB,MUL,DIV} op_code;

typedef struct {
 logic [3:0]result;
 logic [7:0]mul_result;
 logic carry;
}alu_out;


module alu_4bitt(
  input alu_in aluin,
  input op_code opcode,
  output alu_out aluout
    );
    
    always @(*)
     begin
      case(opcode)
      ADD: begin
            {aluout.carry,aluout.result} = aluin.a_in + aluin.b_in + aluin.c_in;
           end
      SUB: begin
             {aluout.carry,aluout.result} = aluin.a_in - aluin.b_in - aluin.c_in;
           end
      MUL: begin
             aluout.mul_result = aluin.a_in * aluin.b_in;
           end
      DIV: begin
              aluout.result = aluin.a_in / aluin.b_in;
           end
      endcase
     end
     
endmodule
