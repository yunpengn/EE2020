`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Niu Yunpeng
// 
// Create Date: 10.09.2017 23:22:33
// Design Name: Lab 2 Task 1
// Module Name: my_full_adder
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


module my_full_adder(
    input A,
    input B,
    input CIN,
    output S,
    output COUT
    );
    
    assign S = A ^ B ^ CIN;
    assign COUT = A & B | CIN & (A ^ B);
    
endmodule
