`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/30 15:28:53
// Design Name: 
// Module Name: pulse_detector
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


module pulse_detector(
    input  wire clk_4,
    input  wire btn_signal,
    output wire out
    );
    
    reg Q1, Q2;
    
    initial begin
        Q1 = 1'b0;
        Q2 = 1'b0;
    end
    
    always @(posedge clk_4) begin
        Q1 <= btn_signal;
        Q2 <= Q1;
    end
    
    assign out = Q1 & ~Q2;
endmodule
