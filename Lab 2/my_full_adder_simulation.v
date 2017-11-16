`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Niu Yunpeng
// 
// Create Date: 10.09.2017 23:31:29
// Design Name: 
// Module Name: my_full_adder_simulation
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


module my_full_adder_simulation(

    );
    
    // Inputs
    reg A;
    reg B;
    reg CIN;
    
    // Outputs
    wire S;
    wire COUT;
    
    // Instantiate Device Under Test (DUT)
    my_full_adder dut(A, B, CIN, S, COUT);
    
    // Simulate
    initial begin
        A = 0; B = 0; CIN = 0; #10;
        A = 0; B = 0; CIN = 1; #10;
        A = 0; B = 1; CIN = 0; #10;
        A = 0; B = 1; CIN = 1; #10;
        A = 1; B = 0; CIN = 0; #10;
        A = 1; B = 0; CIN = 1; #10;
        A = 1; B = 1; CIN = 0; #10;
        A = 1; B = 1; CIN = 1; #10;
    end
endmodule
