`timescale 1ns / 1ps

module test_slow_blinky();
    reg CLOCK;
    wire LED;
    
    slow_blinky_module dut(CLOCK, LED);
    
    initial begin
        CLOCK = 0;
    end
    
    always begin
        #5 CLOCK = ~CLOCK;
    end
endmodule
