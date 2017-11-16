`timescale 1ns / 1ps

module test_single_pulse();
    reg CLOCK;
    reg BUTTON;
    wire OUT;
    
    // Instantiate the Device Under Test
    single_pulse dut(CLOCK, BUTTON, OUT);
    
    initial begin
        CLOCK = 0;
        BUTTON = 0;
        #22 BUTTON = ~BUTTON;
    end
    
    always begin
        #5 CLOCK = ~CLOCK;
    end
endmodule
