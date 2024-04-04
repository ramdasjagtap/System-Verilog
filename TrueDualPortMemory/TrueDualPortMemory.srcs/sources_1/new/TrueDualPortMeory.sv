`timescale 1ns / 1ps

 typedef struct {
  bit clk_write;
  bit clk_read;
   logic [9:0]  address;
   logic cs;
   logic [7:0] data_in;
   logic RW;
   logic data_out_en;
 }i_port;

 typedef struct {
    logic [7:0] data_out;
 }o_port;

 module TrueDualPortMeory(
    input i_port port1_in,
    input i_port  port2_in,
    output o_port port1_out,
    output o_port port2_out
   );
    
    // 1kbyte memory
  logic [7:0] memory[0:1023];
     
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
