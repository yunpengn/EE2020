`timescale 1ns / 1ps

module display_controller(
    input [12:0] number,
    input clk_20k,
    output reg [7:0] seg,
    output reg [3:0] digit
    );
    
    // Convert a 13-bit binary number into a group of 4 BCD numbers.
    wire [3:0] thousands;
    wire [3:0] hundreds;
    wire [3:0] tens;
    wire [3:0] ones;
    binary_to_bcd_converter converter(number, thousands, hundreds, tens, ones);
    
    // A temporary due to multiplexed display.
    reg [3:0] current_display;
    
    initial begin
        digit <= 4'b1110;
        current_display <= ones;
    end
    
    // Basys 3 board only provideds a multiplexed 4-digit display.
    // Notice the multiplexer is active-low signal.
    always @(posedge clk_20k) begin
        // Switch between different digits at a relatively high frequency.
        case (digit)
            4'b1110: begin
                digit <= 4'b1101;
                current_display <= tens;
            end
            4'b1101: begin
                digit <= 4'b1011;
                current_display <= hundreds;
            end
            4'b1011: begin
                digit <= 4'b0111;
                current_display <= thousands;
            end
            4'b0111: begin
                digit <= 4'b1110;
                current_display <= ones;
            end
            default: begin
                digit <= 4'b1110;
                current_display <= 4'hF;
            end
        endcase
    end
    
    // Convert from a BCD to the actual 7-segment display configuration.
    // Notice the 7-segment LEDs are active-low signals.
    // seg[7] is the dot ".", we never use it when displaying an integer.
    always @(*) begin
        case (current_display) 
            4'd0: seg <= 8'b11000000; 
            4'd1: seg <= 8'b11111001; 
            4'd2: seg <= 8'b10100100; 
            4'd3: seg <= 8'b10110000; 
            4'd4: seg <= 8'b10011001; 
            4'd5: seg <= 8'b10010010; 
            4'd6: seg <= 8'b10000010; 
            4'd7: seg <= 8'b11111000; 
            4'd8: seg <= 8'b10000000; 
            4'd9: seg <= 8'b10010000;
            default:  seg <= 8'b01111111;
        endcase
    end
endmodule
