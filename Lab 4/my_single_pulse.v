`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Niu Yunpeng
//////////////////////////////////////////////////////////////////////////////////

module my_single_pulse(input CLOCK, input BUTTON, output OUT);
    wire Q1;
    wire Q2;
    
    // Instantiate two dff blocks.
    my_dff dff1(CLOCK, BUTTON, Q1);
    my_dff dff2(CLOCK, Q1, Q2);
    
    assign OUT = Q1 & ~Q2;
endmodule
