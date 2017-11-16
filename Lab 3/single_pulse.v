`timescale 1ns / 1ps

module single_pulse(input CLOCK, input BUTTON, output OUT);
    // The output of the slow clock
    wire SLOW_CLOCK;
    // The outputs of two D-flip-flops
    wire Q1;
    wire Q2;
    
    // Creates a slow clock of 4Hz.
    slow_clock my_clock(CLOCK, SLOW_CLOCK);
    // Creates two D-flip-flops.
    my_dff dff1(SLOW_CLOCK, BUTTON, Q1);
    my_dff dff2(SLOW_CLOCK, Q1, Q2);
    
    // The final AND gate.
    assign OUT = Q1 & ~Q2;
endmodule
