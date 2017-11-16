`timescale 1ns / 1ps

module test_clock1();
    reg CLOCK;
    wire OUT;
    
    my_clock1 clock1(CLOCK, OUT);
    
    initial begin
        CLOCK = 0;
    end
    
    always begin
        #5 CLOCK = ~CLOCK;
    end
    
endmodule
