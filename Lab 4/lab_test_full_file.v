`timescale 1ns / 1ps


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Student name on matriculation card: Niu Yunpeng
// Student matriculation number: A0162492A
// Session (Delete as appropriate): Monday
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// FURTHER INSTRUCTIONS IN ADDITION TO THOSE PROVIDED ON THE QUESTION PAPER:                                            //
// 1) Fill in your NAME, MATRICULATION NUMBER and SESSION above.                                                        //
// 2) Open the provided module :  session_black_box.                                                                    //
// 3) Understand the instructions provided in session_black_box, and analyse the inputs and outputs.                    //
// 4) Work on your design task as indicated in the questions paper.                                                     // 
// 5) Instantiate session_black_box and link inputs and outputs accordingly.                                            //
// 6) Generate bitstream and download to ther Basys 3 development board for testing.                                    //
//                                                                                                                      //
// Proceed step-by-step, ensuring that no errors or critical warnings are present.                                      //
// Ensure that you are able to generate bitstream before time is up!                                                    //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The lab_test_module module declaration and the constraint file is incomplete.                                        //
// You would need to add more signals as you proceed with the design task.                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module lab_test_module(input clk, input [2:0] examiner_value, input session_pb,
                       output [3:0] link_with_box_output_1, output [7:0] link_with_box_output_2,
                       output reg [5:0] my_register_one);
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Do not change this skeleton code below                                                                               //
    wire [2:0] link_to_box_input_7;
    assign link_to_box_input_7 = (session_pb == 1) ? 7 : examiner_value;
    // Note that the automatic counter display values will freeze when the session_pb is pressed. This is intended          //                                        
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // Declares my_register_two internally.
    reg [13:0] my_register_two;
    
    // Creates the 3 required slow clocks.
    wire out1;
    wire out2;
    wire out3;
    my_clock1 clock1(clk, out1);
    my_clock2 clock2(clk, out2);
    my_clock3 clock3(clk, out3);
    
    // Creates a single-pulse circuit.
    wire pulse;
    my_single_pulse single_pulse(out2, session_pb, pulse);
    
    // Initialize the value of my_register_one and my_register_two.
    initial begin
        my_register_one = 6'b100111;
        my_register_two = 400;
    end
    
    // Increment my_register_one when the user pushes the button and then have a single pulse.
    always @(posedge pulse) begin
        my_register_one <= my_register_one + 1;
    end
    
    // Increment my_register_two automatically.
    always @(posedge out1) begin
        my_register_two <= my_register_two + 1;
    end
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Instantiate the session_black_box below, with the correct input and output signals.                                  //
    // Refer to the description in the session_black_box module for details.                                                //
    // There is no need to declare link_with_box_output_1, link_with_box_output_2 as wire                                   //
    // You may assume that the session_black_box signal: box_input_3 takes a value between 0 to 9999                        // 
    // You do not need to take care of values more than 9999 for the session_black_box signal: box_input_3                  //
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    session_black_box black_box(clk, out3, my_register_two, link_with_box_output_1, link_with_box_output_2, out1, out2, out3, link_to_box_input_7);
    
endmodule
