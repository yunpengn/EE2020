`timescale 1ns / 1ps

// box_input_1: A clock signal with frequency of 100 MHz to this module
// box_input_2: A clock signal with frequency f3 (f three) to this module
// box_input_3: A 14-bit input value to this module (The signal to pass here from lab_test_module is the value in my_register_two)
// box_output_1: A 4-bit output value from this module (The signal is passed from here to the lab_test_module's signal: link_with_box_output_1)
// box_output_2: An 8-bit output value from this module (The signal is passed from here to the lab_test_module's signal: link_with_box_output_2)
// box_input_4: A clock signal with frequency f1 (f one) to this module
// box_input_5: A clock signal with frequency f2 (f two) to this module
// box_input_6: A clock signal with frequency f3 (f three) to this module
// box_input_7: A 3-bit input value (The signal to pass here from lab_test_module is: link_to_box_input_7)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// STUDENTS DO NOT NEED TO KNOW WHAT CODES ARE PRESENT WITHIN THE session_black_box MODULE                              //
// STUDENTS SHOULD NOT MODIFY ANY CODES / DECLARATIONS BELOW THIS LINE                                                  //          
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module session_black_box (input box_input_1, input box_input_2, input [13:0] box_input_3, output reg [3:0] box_output_1, output reg [7:0] box_output_2, input box_input_4, box_input_5, box_input_6, input [2:0] box_input_7);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// STUDENTS DO NOT NEED TO READ, NOR UNDERSTAND THE CODES BELOW THIS LINE                                               //          
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    reg lock_display = 0;
    reg [3:0] display_decimal = 0;
    reg [13:0] internal_display_value = 0, locked_display_value = 0;
    reg [31:0] edge_count = 0, edge_one_1 = 0, edge_two_1 = 0, edge_one_2 = 0, edge_two_2 = 0, edge_one_3 = 0, edge_two_3 = 0;
          
    always @ (posedge box_input_1) begin edge_count <= edge_count + 1; end
    always @ (posedge box_input_4) begin edge_one_1 <= edge_two_1; edge_two_1 <= edge_count; end
    always @ (posedge box_input_5) begin edge_one_2 <= edge_two_2; edge_two_2 <= edge_count; end
    always @ (posedge box_input_6) begin edge_one_3 <= edge_two_3; edge_two_3 <= edge_count; end
   
    always @ (posedge box_input_2) 
    begin
        case (box_input_7)
            3'b001: internal_display_value <= ( 100000000 / (edge_two_1 - edge_one_1));
            3'b010: internal_display_value <= ( 100000000 / (edge_two_2 - edge_one_2));
            3'b011: internal_display_value <= ( 100000000 / (edge_two_3 - edge_one_3));
            3'b111: begin lock_display <= 1; locked_display_value <= (locked_display_value == 0) ? box_input_3 : locked_display_value ; end
            default: begin internal_display_value <= (lock_display == 1) ? locked_display_value : box_input_3; end
        endcase
           
        case (box_output_1)
            4'b0111: begin box_output_1 <= 4'b1110; display_decimal <= (internal_display_value/1)%10; end
            4'b1110: begin box_output_1 <= 4'b1101; display_decimal <= (internal_display_value/10)%10; end
            4'b1101: begin box_output_1 <= 4'b1011; display_decimal <= (internal_display_value/100)%10; end
            4'b1011: begin box_output_1 <= 4'b0111; display_decimal <= (internal_display_value/1000)%10; end
            default: begin box_output_1 <= 4'b1110; display_decimal <= 4'hF; end
        endcase
    end
    
    always @ (*)
    begin        
        case (display_decimal) 
            4'd0 : box_output_2 <= 8'b11000000; 
            4'd1 : box_output_2 <= 8'b11111001; 
            4'd2 : box_output_2 <= 8'b10100100; 
            4'd3 : box_output_2 <= 8'b10110000; 
            4'd4 : box_output_2 <= 8'b10011001; 
            4'd5 : box_output_2 <= 8'b10010010; 
            4'd6 : box_output_2 <= 8'b10000010; 
            4'd7 : box_output_2 <= 8'b11111000; 
            4'd8 : box_output_2 <= 8'b10000000; 
            4'd9 : box_output_2 <= 8'b10010000;
            default:  box_output_2 <= 8'b01111111;
        endcase    
    end
    
endmodule
