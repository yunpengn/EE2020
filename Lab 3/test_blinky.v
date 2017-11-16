`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Niu Yunpeng
// 
// Create Date: 17.09.2017 21:47:00
// Design Name: 
// Module Name: test_blinky
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


module test_blinky();
    // Inputs and Outputs
    reg CLOCK;
    wire LED;
    
    // Instantiate the Device Under Test
    blinky dut(CLOCK, LED);
    
    initial begin
        CLOCK = 0;
    end
    
    always begin
        #5 CLOCK = ~CLOCK;
    end
endmodule
