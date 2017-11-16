`timescale 1ns / 1ps

module slow_clock(input CLOCK, output reg LED);
    parameter N = 24;
    
    // COUNT will be extended to the left with zeros to the correct bit width.
    reg [N - 1:0] COUNT = 1'b0;
    
    initial begin
        LED = 0;
    end
    
    always @ (posedge CLOCK) begin
        COUNT <= COUNT + 1;
        // The N(.) here is replication operator
        LED <= (COUNT == {N{1'b0}}) ? ~LED : LED;
    end
endmodule
