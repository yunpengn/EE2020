`timescale 1ns / 1ps

module single_pulse_counter(input CLOCK, input BUTTON, output reg [7:0] OUT);
    wire PULSE;
    
    // The initial value is 0.
    initial begin
        OUT = 8'b0000_0000;
    end
    
    // Creates single pulse circuit.
    single_pulse my_pulse(CLOCK, BUTTON, PULSE);
    
    // Increment by 1 whenever pressing the push button.
    always @ (posedge PULSE) begin
        OUT <= OUT + 1;
    end
endmodule
