`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Niu Yunpeng
// 
// Create Date: 17.09.2017 22:19:01
// Design Name: 
// Module Name: slow_blinky_module
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


module slow_blinky_module(input CLOCK, output reg LED);
    // A simple 4-bit counter.
    reg [3:0] COUNT = 4'b0000;
    
    initial begin
        LED = 0;
    end
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        LED <= (COUNT == 4'b0000) ? ~LED : LED;
    end
endmodule
