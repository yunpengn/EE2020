`timescale 1ns / 1ps

module my_dff(input DFF_CLOCK, input D, output reg Q);
    always @ (posedge DFF_CLOCK) begin
        Q <= D;
    end
endmodule
