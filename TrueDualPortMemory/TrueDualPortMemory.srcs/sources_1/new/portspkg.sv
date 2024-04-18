`timescale 1ns / 1ps

 package ports;
 
 parameter DEPTH = 1024;
parameter  WIDTH = 8;

 typedef struct {
  bit clk_write;
  bit clk_read;
   logic [$clog2(DEPTH)-1:0]  address;
   logic cs;
   logic [WIDTH-1:0] data_in;
   logic RW;
   logic data_out_en;
 }i_port;

 typedef struct {
    logic [WIDTH-1:0] data_out;
 }o_port;

endpackage
