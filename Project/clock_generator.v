`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/09 15:15:40
// Design Name: 
// Module Name: clock_generator
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


module clock_generator(
    input CLK,
    output reg clk_20k,
    output reg clk_50M,
    output reg clk_4
    );
    
    reg [11:0] count = 12'd0;
    reg [19:0] count_4 = 20'b0;
    
    initial begin
        clk_20k <= 1'b0;
        clk_50M <= 1'b0;
        clk_4 <= 1'b0;
    end
    
    always @(posedge CLK) begin
        clk_50M <= ~clk_50M;
    end
    
    always @(posedge CLK) begin
        count <= (count == 2499) ? 0 : count + 1;
        clk_20k <= (count == 0) ? ~ clk_20k : clk_20k;
    end
    
    always @(posedge CLK) begin
        count_4 <= count_4 + 1;
        clk_4 <= (count_4 == 0) ? ~ clk_4 : clk_4;
    end
    
endmodule
