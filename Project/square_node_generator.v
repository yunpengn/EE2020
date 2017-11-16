`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/01 11:19:12
// Design Name: 
// Module Name: square_node_generator
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


// Creates a 11-bit digital signal of different musical nodes based on the selection input.
module square_node_generator(
    input clk,
    input [4:0] select,
    output reg [11:0] out
    );
    
    // How many rounds to count (so as to make different frequencies): 100MHz / required frequency / 2.
    reg [17:0] doi = 190839;
    reg [17:0] re = 170067;
    reg [17:0] mi = 151514;
    reg [17:0] fa = 143265;
    reg [17:0] so = 127550;
    
    wire [17:0] count_until;
    
    // Select how many rounds until we can reverse the value of the node_clock_out.
    assign count_until = select[0] ? doi
                      : (select[1] ? re
                      : (select[2] ? mi
                      : (select[3] ? fa
                      : so)));
    
    // Used to create slow clock.
    reg [17:0] count = 0;
    reg slow_clock = 0;
    
    always @(posedge clk) begin
        // Generate the required clock used to create square wave.
        count <= (count == count_until) ? 0 : count + 1;
        slow_clock <= (select == 0) ? 1'bz
                                    : ((count == 0) ? ~slow_clock
                                                    : slow_clock);
        
        out = {12{slow_clock}};
    end
endmodule
