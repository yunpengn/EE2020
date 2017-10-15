***********
* PAGE 09 *
***********

module my_control_module(
    input A,
    input B,
    output LED1,
    output LED2,
    output LED3
    );
    
    assign LED1 = (A & ~B) | (A & B);
    // Delete this comment and write the Verilog code for LED2
    // Delete this comment and write the Verilog code for LED2
    
endmodule


***********
* PAGE 12 *
***********

module my_control_module_simulation(

    );
    
    // Inputs
    reg A;
    reg B;
    
    // Outputs
    wire LED1;
    wire LED2;
    wire LED3;
    
    // Instantiate Device under Test (DUT)
    my_control_module dut(A, B, LED1, LED2, LED3);
    
    //Stimuli
    initial begin
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;    
    end 
    
endmodule


***********
* PAGE 17 *
***********

set_property PACKAGE_PIN V17 [get_ports {A}]
set_property IOSTANDARD LVCMOS33 [get_ports {A}]

set_property PACKAGE_PIN V16 [get_ports {B}]
set_property IOSTANDARD LVCMOS33 [get_ports {B}]

set_property PACKAGE_PIN U16 [get_ports {LED1}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED1}]

set_property PACKAGE_PIN E19 [get_ports {LED2}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED2}]

set_property PACKAGE_PIN U19 [get_ports {LED3}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED3}]


***********
* PAGE 21 *
***********

module my_2_to_1_mux (input A, B, S, output Z); 

    // assign B to Z if S = 1 or assign A to Z if S = 0;
    assign Z = S ? B : A; 
			    
endmodule