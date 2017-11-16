`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2017 15:01:44
// Design Name: 
// Module Name: add_overall_switch_simulation
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


module add_overall_switch_simulation(

    );
    
    // Inputs
    reg A;
    reg B;
    reg C;
    
    // Outputs
    wire LED1;
    wire LED2;
    wire LED3;
    
    // Device Under Test (DUT)
    add_overall_switch dut(A, B, C, LED1, LED2, LED3);
    
    // Starts testing
    initial begin
        A = 0; B = 0; C = 0; #10;
        A = 0; B = 1; C = 0; #10;
        A = 0; B = 0; C = 1; #10;
        A = 0; B = 1; C = 1; #10;
        A = 1; B = 0; C = 0; #10;
        A = 1; B = 1; C = 0; #10;
        A = 1; B = 0; C = 1; #10;
        A = 1; B = 1; C = 1; #10;
    end
endmodule
