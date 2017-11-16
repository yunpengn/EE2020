`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/01 10:55:43
// Design Name: 
// Module Name: hello_playback
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module hello_playback(
    input clk_20k,
    input clk_4,
    input pause_button,
    output reg [11:0] out
    );
    // Assign the next value in ROM memory to value.
    reg [12:0] index_pointer = 0;
    wire [11:0] value;
    hello_data memory(index_pointer, value);
    
    // Use a single pulse module to implement the pause/resume feature.
    wire pulse_result;
    reg continue_or_not = 1;
    pulse_detector my_pulse(clk_4, pause_button, pulse_result);
    always @(posedge pulse_result) begin
        continue_or_not <= ~continue_or_not;
    end
    
    // Final assign the value to output.
    always @(posedge clk_20k) begin
        index_pointer <= continue_or_not ? index_pointer + 1 : index_pointer;
        out <= continue_or_not ? value : {12{1'b0}};
    end
endmodule
