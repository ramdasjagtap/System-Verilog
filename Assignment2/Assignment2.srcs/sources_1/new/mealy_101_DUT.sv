`timescale 1ns / 1ps
`include "fsm_ifc.sv"

module mealy_101_DUT(fsm_ifc.fsm_DUT FSM);

typedef enum bit[1:0] {S0,S1,S2}states;

logic [1:0] curr_state,next_state;
always_ff @(negedge FSM.clk)
  begin
   if(FSM.arst)
    curr_state <= S0;
  else
   curr_state <= next_state;
  end
  
  always_comb
     begin
      case(curr_state)
        S0: next_state = FSM.in? S1: S0;
        S1: next_state = FSM.in? S1: S2;
        S2: next_state = FSM.in? S0: S0;
       default: next_state = S0;
      endcase
     end
     
    always_comb 
       begin
        case(curr_state)
        S0: FSM.out = 1'b0;
        S1: FSM.out = 1'b0;
        S2: begin
         if(FSM.in)
           begin
                   FSM.out = 1'b1;
           end
        else begin
                   FSM.out = 1'b0;
        end
        end
       default: FSM.out = 1'b0;
      endcase
    end
    
endmodule
