`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/01 12:00:05
// Design Name: 
// Module Name: triangle_node_generator
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
module triangle_node_generator(
    input clk,
    input [4:0] select,
    output reg [11:0] out
    );
    
    // How many rounds to wait to increase one in triangle wave.
    parameter doi_inc = 23;
    parameter re_inc = 21;
    parameter mi_inc = 18;
    parameter fa_inc = 17;
    parameter so_inc = 16;
    
    // The maximum value output can reach (we need to switch the direction of increase/decrease then).
    parameter max_out = 4095;    
    
    wire [7:0] increment_until;
    
    // Select how many rounds until we can increase the value of the output by 1..
    assign increment_until = select[0] ? doi_inc
                                       : (select[1] ? re_inc
                                                    : (select[2] ? mi_inc
                                                                 : (select[3] ? fa_inc : so_inc)));
    
    // Used to create slow clock.
    reg [7:0] increment_count = 0;
    
    // Indicate increase or decrease
    reg increase_or_decrease = 1;
    
    initial begin
        out = 1;
    end
    
    always @(posedge clk) begin
        // Create the slow clock to decide when to increase out by 1.
        increment_count = (increment_count == increment_until) ? 0 : increment_count + 1;
        
        // Reverse the direction of increase/decrease.
        increase_or_decrease = (out == 0) ? 1
                                          : ((out == max_out) ? 0 : increase_or_decrease);
        
        // Increment for the output.
        if (select == 0) begin
            out = {12{1'b0}};
        end else begin
            out = (increment_count == 0) ? (increase_or_decrease ? out + 1 : out - 1)
                                         : out;
        end
    end
endmodule
