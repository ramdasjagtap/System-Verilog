`timescale 1ns / 1ps

typedef struct{
 bit clk;
 bit arst;
  bit in;
}i_port;

typedef struct {
 bit out;
}o_port;

// non overlapping 101 seq detetcor( mealy machine)
module mealy_seq_101(
  input i_port port_i,
  output o_port port_o
    );
    
   typedef  enum bit [1:0] {S0,S1,S2} states;
    logic [1:0] curr_state,next_state;
    
    // state transition
    always_ff @(negedge port_i.clk)
      begin
        if(port_i.arst)
          begin
             curr_state <= S0;
          end
       else begin
         curr_state <= next_state;
       end
      end
      
     // next state logic
     always_comb 
       begin
        case(curr_state)
        S0: next_state = port_i.in? S1: S0;
        S1: next_state = port_i.in? S1: S2;
        S2: next_state = port_i.in? S0: S0;
       default: next_state = S0;
        endcase
       end
       
       // output 
    always_comb 
       begin
        case(curr_state)
        S0: port_o.out = 1'b0;
        S1: port_o.out = 1'b0;
        S2: begin
         if(port_i.in)
           begin
            port_o.out = 1'b1;
           end
        else begin
                    port_o.out = 1'b0;
        end
        end
       default: port_o.out = 1'b0;
      endcase
    end
    
endmodule
