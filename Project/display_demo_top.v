`timescale 1ns / 1ps

module display_demo_top(input CLK, output [7:0] seg, output [3:0] digit);
    reg [12:0] number = 4085;
    
    reg [11:0] count = 12'd0;
    reg clk_20k;
    
    always @(posedge CLK) begin
        count <= (count == 2499) ? 0 : count + 1;
        clk_20k <= (count == 0) ? ~ clk_20k : clk_20k;
    end
    
    display_controller display(number, clk_20k, seg, digit);
endmodule
