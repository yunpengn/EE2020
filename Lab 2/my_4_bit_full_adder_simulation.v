`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Niu Yunpeng
// 
// Create Date: 11.09.2017 00:12:27
// Design Name: 
// Module Name: my_4_bit_full_adder_simulation
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


module my_4_bit_full_adder_simulation(

    );
    
    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg CIN;
    
    // Outputs
    wire [3:0] S;
    wire COUT;
    
    // Instantiate Device Under Test (DUT)
    my_4_bit_full_adder dut(A, B, CIN, S, COUT);
    
    initial begin
        A = 4'b0011; B = 4'b0011; CIN = 1'b0; #10;
        A = 4'b1011; B = 4'b0111; CIN = 1'b0; #10;
        A = 4'b1111; B = 4'b1111; CIN = 1'b0; #10;
    end
endmodule
