`timescale 1ns / 1ps

import  ports ::*;

 module TrueDualPortMeory(
    input i_port port1_in,
    input i_port  port2_in,
    output o_port port1_out,
    output o_port port2_out
   );
    
    // 1kbyte memory
  logic [WIDTH-1:0] memory[0:DEPTH];
     
     // port - 1 
    // writing into memory     RW == 0;
    always_ff @(posedge port1_in.clk_write)
     begin
        if(port1_in.cs)
         begin
           if(!port1_in.RW )
             begin
               memory[port1_in.address] <= port1_in.data_in;
             end
         end 
     end
    
        // reading  from memory     RW == 1;
        logic [7:0] temp1;
    always_ff @(posedge port1_in.clk_read)
     begin
        if(port1_in.cs)
         begin
           if(port1_in.RW  )
             begin
             temp1 <=  memory[port1_in.address] ;
             end
         end 
     end
       assign  port1_out.data_out =  (port1_in.RW  && port1_in.data_out_en && port1_in.cs) ? temp1:  'hzz;

     // port 2
      // writing into memory     RW == 0;
    always_ff @(posedge port2_in.clk_write)
     begin
        if(port2_in.cs)
         begin
           if(!port2_in.RW )
             begin
               memory[port2_in.address] <= port2_in.data_in;
             end
         end 
     end
    
        // reading  from memory     RW == 1;
       logic  [7:0] temp2;
    always_ff @(posedge port2_in.clk_read)
     begin
        if(port2_in.cs)
         begin
           if(port2_in.RW )
             begin
              temp2<=  memory[port2_in.address] ;
             end
         end 
     end
     
     assign  port2_out.data_out =  (port2_in.RW  && port2_in.data_out_en && port2_in.cs) ? temp2:  'hzz;
     
 endmodule
