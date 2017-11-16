`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/01 11:17:10
// Design Name: 
// Module Name: music_node_selector
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


module music_node_selector(
    input clk,
    input [5:0] select,
    output [11:0] out
    );
    
    wire [4:0] node_select;
    wire [11:0] square_out;
    wire [11:0] triangle_out;
    
    assign node_select = { select[4], select[3], select[2], select[1], select[0] };
    
    square_node_generator square_node(clk, node_select, square_out);
    triangle_node_generator triangle_node(clk, node_select, triangle_out);
    
    assign out = select[5] ? triangle_out : square_out;
endmodule
