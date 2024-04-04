`timescale 1ns / 1ps

module tb_alu_4bit();
    
  alu_in aluin;
  op_code opcode;
  alu_out aluout;
    
   alu_4bitt DUT(.*);
   
   
   initial
    begin
    aluin.a_in = 'd0; aluin.b_in = 'd0; aluin.c_in = 'd0; opcode = ADD;
    #10;
    aluin.a_in = 'd10; aluin.b_in = -'d5; aluin.c_in = 'd1; opcode = ADD;
    #10;
    opcode = SUB;
    #10;
    opcode = MUL;
    #10;
    opcode = DIV;
    #10;
    $finish();
    end
   
endmodule
