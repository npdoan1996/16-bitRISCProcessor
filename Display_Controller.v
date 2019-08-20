`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  Display_Controller
 * Project:    Lab_Assignment_5
 * Designer:   Randolph DeLeon
 * Email:      randolph.deleon@student.csulb.edu
 * Rev. No.:   Version 1.0
 * Rev. Date:  10/13/2018
 *
 * Purpose: 	The purpose of this module is to take four different modules 
 *					(pixel clock, pixel controller, mux8to1, hex to 7 segment) and
 *					instantiate them to form a Display Controller module. This 
 *					module can be easily used in many different applications. The 
 *					display controller module takes in the clock, reset, and 32 bits
 *					of data and outputs the corresponding 7 segment and anode control.
 *         
 *
 ****************************************************************************/

module Display_Controller( clk, reset, 
									seg7, seg6, seg5, seg4, seg3, seg2, seg1, seg0,
									anode, segA, segB, segC, segD, segE, segF, segG);
	
	// Declare inputs and outputs
	input 				clk, reset;
	input 	 [3:0]	seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7; 
	output	 [7:0]	anode;
	output				segA, segB, segC, segD, segE, segF, segG;

	wire 					pClk;
	wire 		 [3:0]	hexNum;
	wire		 [2:0]	seq;
								
								//clk_in,	reset,	clk_out
	pixel_clk 			p1	( clk, 		reset, 	pClk);
	
								//clk, reset, seq_sel, an
	pixel_controller	p2 ( pClk, reset, seq, anode);
	
								//sel, 	d0, 	d1, 	d2, 	d3, 	d4, 	d5, 	d6, 	d7, 	Y								
	mux8to1				m1 ( seq, seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7, hexNum);
	
								//   hex, segA, segB, segC, segD, segE, segF, segG
	hex_to_7segment	h1	( hexNum, segA, segB, segC, segD, segE, segF, segG);
 

endmodule
