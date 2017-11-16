`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: National University of Singapore
// Engineer: Niu Yunpeng
// 
// Create Date: 04.09.2017 14:53:42
// Design Name: Practice Task 1
// Module Name: add_overall_switch
// Project Name: EE2020 Lab 1
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


module add_overall_switch(
    input A,
    input B,
    input C,
    output LED1,
    output LED2,
    output LED3
    );
    
    assign LED1 = C & ((A & ~B) | (A & B));
    assign LED2 = C & ((~A & B) | (A & B));
    assign LED3 = C & (A & B);
endmodule
