`timescale 1ns / 1ps

// The input is within the range of [0£¬ 8191].
module binary_to_bcd_converter(
    input [12:0] binary,
    output reg [3:0] thousands,
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] ones);
    
    // Temporary variable used in loop.
    integer i;
    
    // The 7-segment display needs to be updated whenever the input binary value is changed.
    always @(binary) begin
        // Clear the previous values
        thousands = 4'd0;
        hundreds = 4'd0;
        tens = 4'd0;
        ones = 4'd0;
        
        for (i = 12; i >= 0; i = i - 1) begin
            // Requirements for a correct BCD number.
            if (thousands >= 5)
                thousands = thousands + 3;
            if (hundreds >= 5)
                hundreds = hundreds + 3;
            if (tens >= 5)
                tens = tens + 3;
            if (ones >= 5)
                ones = ones + 3;
            
            // Shift one bit to the left.
            thousands = thousands << 1;
            thousands[0] = hundreds[3];
            hundreds = hundreds << 1;
            hundreds[0] = tens[3];
            tens = tens << 1;
            tens[0] = ones[3];
            ones = ones << 1;
            ones[0] = binary[i];
        end
    end
endmodule
