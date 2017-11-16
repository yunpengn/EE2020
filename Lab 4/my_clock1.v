`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Niu Yunpeng
//////////////////////////////////////////////////////////////////////////////////

// This slow clock has a frequency of 95Hz.
module my_clock1(input CLOCK, output reg OUT);
    reg [19:0] COUNT = 0;
    
    initial begin
        OUT = 0;
    end
    
    always @(posedge CLOCK) begin
        COUNT <= COUNT + 1;
        OUT <= (COUNT == 0) ? ~OUT : OUT;
    end
endmodule
