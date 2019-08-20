`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  clk_div.v
 * Project:    Lab_Assignment_5
 * Designer:   Nguyen Doan
 * Email:      npdoan1996@gmail.com
 * Rev. No.:   Version 2.0
 * Rev. Date:  9/24/2018
 *
 * Purpose: This module is to generate a 500Hz clock from the 100 MHz clock. 
 *				The method to do that is: first set a integer variable i = 0 and 
 *				clock_out = 0,then increase it 1 at every positive edge of the 
 *				clock_in, when the i reaches half the value of the period of the 
 *				clock_out, negate clk_out and set i = 0. Then this process will be 
 *				repeated again and again. The value of the counter that counts the 
 *				incoming clock ticks is equal to
 *					[ (Incoming Freg/ Outgoing Freg) / 2]
 *
 ****************************************************************************/

module clk_div(clk_in, reset, clk_out);
    
	 // Declare inputs and outputs
	 input   clk_in, reset;
    output  clk_out;
    reg     clk_out;
    integer i;
    
    always @(posedge clk_in or posedge reset) begin
        if (reset == 1'b1) begin
            i = 0;
            clk_out = 0;
         end 
         // get a clock, so increment the counter and 
         // test to see if half a period has elapsed
         else begin
            i = i +1;
            if (i >= 100000) begin
                clk_out = ~clk_out;
                i = 0;
            end // if
         end // else
    end // always

endmodule   