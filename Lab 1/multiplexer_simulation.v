`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2017 15:23:42
// Design Name: 
// Module Name: multiplexer_simulation
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


module multiplexer_simulation(

    );
    
    // Inputs
    reg A;
    reg B;
    reg S;
    
    // Outputs
    wire Z;
    
    // Device Under Test (DUT)
    multiplexer dut(A, B, S, Z);
    
    initial begin
        S = 0; A = 0; B = 0; #10;
        S = 0; A = 1; B = 0; #10;
        S = 1; A = 0; B = 0; #10;
        S = 1; A = 0; B = 1; #10; 
    end
endmodule
