`timescale 1ns/1ps

module up_down_counter(
 output logic [2:0] count,
 input logic mode,
 input logic clk,
 input logic arst
);

always_ff @(posedge clk or posedge arst )
  begin
  if(arst)
      begin
       count <= 'd0;
     end
  else if(mode) begin
    count <= count + 'd1;
  end
 end

 always_ff @(posedge clk or posedge arst )
  begin
  if(arst)
      begin
       count <= 'd7;
     end
  else if(!mode) begin
    count <= count  -  'd1;
  end
 end
 
endmodule