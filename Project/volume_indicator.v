`timescale 1ns / 1ps


module volume_indicator(
    input  wire clk_20k,
    input  wire [11:0] MIC_IN,
    output reg  [11:0] led
    );
    
    parameter SAMPLE = 1000;
    
    reg [11:0] peak_value = 12'b0;
    reg [4:0] temp_value;
    reg [3:0] after_divide;
    
    reg [11:0] counter = 12'b0;
    
    always @(posedge clk_20k) begin
        if (MIC_IN > peak_value) begin
            peak_value = MIC_IN;
        end
        
        counter <= (counter == SAMPLE) ? 0 : counter + 1;
        
        if (counter == SAMPLE) begin
            led <= peak_value;
            peak_value <= 0;
        end
    end
    
    
endmodule
