`timescale 1ns / 1ps

interface mux_ifc();
logic [1:0] sel;
logic in0, in1, in2, in3;
logic mux_out;

// DUT modport
modport MUX_DUT (
    output mux_out,
    input sel,
    input in0, in1, in2, in3
);

// TB modport
modport MUX_TB (
    input mux_out,
    output sel,
    output in0, in1, in2, in3
);

// Monitor modport
modport MUX_MNTR (
        input mux_out,
        input sel,
        input in0, in1, in2, in3
);

endinterface
