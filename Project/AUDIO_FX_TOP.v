`timescale 1ns / 1ps

module AUDIO_FX_TOP(
    input CLK,            // 100MHz FPGA clock
    
    input  J_MIC3_Pin3,   // PmodMIC3 audio input data (serial)
    output J_MIC3_Pin1,   // PmodMIC3 chip select, 20kHz sampling clock
    output J_MIC3_Pin4,   // PmodMIC3 serial clock (generated by module SPI.v)
     
    output J_DA2_Pin1,    // PmodDA2 sampling clock (generated by module DA2RefComp.vhd)
    output J_DA2_Pin2,    // PmodDA2 Data_A, 12-bit speaker output (generated by module DA2RefComp.vhd)
    output J_DA2_Pin3,    // PmodDA2 Data_B, not used (generated by module DA2RefComp.vhd)
    output J_DA2_Pin4,    // PmodDA2 serial clock, 50MHz clock
    
    input  RsRx,
    input  btnU,          // volume up
    input  btnD,          // volume down
    input  btnC,          // hello play back
    input  [15:0] sw, 
    output [11:0] led
    );

    //////////////////////////////////////////////////////////////////////////////////
    // Clock Divider Module: Generate necessary clocks from 100MHz FPGA CLK
    // Please create the clock divider module and instantiate it here.
      wire clk_20k;
      wire clk_50M;
      wire clk_4;
            
      clock_generator clock_generator(CLK, clk_20k, clk_50M, clk_4);
      
  
     //////////////////////////////////////////////////////////////////////////////////
     //SPI Module: Converting serial data into a 12-bit parallel register
     //Do not change the codes in this area
       wire [11:0]MIC_in;
       SPI u1 (CLK, clk_20k, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, MIC_in);
   
    /////////////////////////////////////////////////////////////////////////////////////
    // Real-time Audio Effect Features
    // Please create modules to implement different features and instantiate them here   
        wire [11:0] speaker_out;
        wire [11:0] after_delay;
        wire [11:0] play_back_output;
        wire [11:0] music_instrument;
        wire [11:0] led_volume;
        wire [11:0] latch_input;
        wire [11:0] latch_output;
        wire [11:0] input_from_uart;
        
        /* voice delay 0.25s
         * controlled by sw[15]
         */
        delay_voice delay_voice(clk_20k, MIC_in, after_delay);
        
        /*
         * hello play back
         * controlled by sw[14]
         */
        hello_playback hello_playback(clk_20k, clk_4, btnC, play_back_output);
        
        /*
         * music instrument
         * sw[12], sw[11], sw[10], sw[9], sw[8], sw[7]
         */
        music_node_selector music_node(CLK, {sw[12], sw[11], sw[10], sw[9], sw[8], sw[7]}, music_instrument);
        
        assign latch_input = (sw[15] == 1) ? after_delay :
                             (sw[14] == 1) ? play_back_output :
                             (sw[12] == 1) ? music_instrument :
                             (sw[11] == 1) ? music_instrument :
                             (sw[10] == 1) ? music_instrument :
                             (sw[9] == 1) ? music_instrument :
                             (sw[8] == 1) ? music_instrument :
                             (sw[7] == 1) ? music_instrument :
                             MIC_in;
        
        /** a buffer sperates led_output and voice_output **/
        mic_in_latch mic_in_latch(clk_20k, latch_input, led_volume, latch_output);
        
        /* volume indicator
         * sw[0] : normal output
         * sw[1] : linear output
         * sw[2] : log output
         */
        wire [11:0] normal_output, linear_output, log_output;
        volume_indicator volume_indicator(clk_20k, led_volume, normal_output);
        volume_indicator_linear volume_indicator_linear(clk_20k, led_volume, linear_output);
        volume_indicator_log volume_indicator_log(clk_20k, led_volume, log_output);
                     
        /* extra feature : uart
         * sw[13] : open feature
         * btnU   : volume up
         * btnD   : volume down
         */
        wire uart_done;
        wire [11:0] uart_volume_output;     
        uart_data_collector uart_data_collector(CLK, RsRx, clk_4, btnU, btnD, uart_done, input_from_uart, uart_volume_output);
    
        assign led = (sw[13] == 1) ? uart_volume_output :
                     (sw[0] == 1) ? normal_output :
                     (sw[1] == 1) ? linear_output :
                     (sw[2] == 1) ? log_output :
                     12'b0;
    
        assign speaker_out = (sw[13] == 1) ? input_from_uart : latch_output;
    /////////////////////////////////////////////////////////////////////////////////////
    //DAC Module: Digital-to-Analog Conversion
    //Do not change the codes in this area        
      DA2RefComp u2(clk_50M, clk_20k, speaker_out, ,1'b0, J_DA2_Pin2, J_DA2_Pin3, J_DA2_Pin4, J_DA2_Pin1,);
        
  //////////////////////////////////////////////////////////////////////////////////

endmodule
