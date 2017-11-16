`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2017 14:45:03
// Design Name: 
// Module Name: my_2_bit_full_adder_simulation
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


module my_2_bit_full_adder_simulation(

    );
    
    // Inputs
    reg [1:0] A;
    reg [1:0] B;
    reg CIN;
    
    // Outputs
    wire COUT;
    wire [1:0] S;
    
    // Instantiate
    my_2_bit_full_adder dut(A, B, CIN, S, COUT);
    
    initial begin
        A = 2'b00; B = 2'b00; CIN = 1'b0; #10;
        A = 2'b00; B = 2'b01; CIN = 1'b0; #10;
        A = 2'b01; B = 2'b01; CIN = 1'b0; #10;
        A = 2'b01; B = 2'b01; CIN = 1'b1; #10;
    end
endmodule
