`timescale 1ns / 1ps

module mic_in_latch(
    input  wire clk_20k,
    input  wire [11:0] mic_in,
    output reg  [11:0] led_out,
    output reg  [11:0] speaker_out
    );
    
    always @(posedge clk_20k) begin
        led_out <= mic_in;
        speaker_out <= mic_in;
    end
endmodule
