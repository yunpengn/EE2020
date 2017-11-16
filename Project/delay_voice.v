`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/16 14:00:36
// Design Name: 
// Module Name: delay_voice
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


module delay_voice(
    input  wire clk_20k,
    input  wire [11:0] in_voice,
    output wire [11:0] out_voice
    );
    
    parameter MEM_SIZE = 5000;
    
    reg [11:0] memory [0:MEM_SIZE-1];
    reg [12:0] i;
    
    initial begin
        for (i = 0 ; i < MEM_SIZE ; i = i + 1) begin
           memory[i] <= 12'b0111_1111_1111;
        end
    end
    
    always @(posedge clk_20k) begin
        memory[0] <= in_voice;
        for (i = 0 ; i < MEM_SIZE - 1 ; i = i + 1) begin
            memory[i+1] <= memory[i];
        end
    end
    
    assign out_voice = memory[MEM_SIZE-1];
endmodule
