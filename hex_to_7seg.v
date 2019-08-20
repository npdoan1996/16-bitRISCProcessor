`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  hex_to_7seg.v
 * Project:    Lab_Assignment_4
 * Designer:   Randolph DeLeon
 * Email:      randolph.deleon@student.csulb.edu
 * Rev. No.:   Version 2.0
 * Rev. Date:  10/13/18
 *
 * Purpose:		The hex to seven segment module is used in order to take a four
 *  				bit hexadecimal number and display the LED on the seven segment
 *					display accordingly. The Nexys4 board requires that a "0" be
 *					input in order to activate the cathode on the LED therefore 
 *					if the input is equal to "0000001" all LEDs are turned on except
 *					the one belonging to segment "g".
 *         
 *
 ****************************************************************************/
 module hex_to_7segment(hex, segA, segB, segC, segD, segE, segF, segG);
	
	// Declare inputs and outputs
	input 	[3:0]	hex;
	output   		segA, segB, segC, segD, segE, segF, segG;
		
	reg 		[6:0] out;
	
	always @ (hex)
		case (hex)			
			4'b0000 : out = 7'b0000001; // hexadecimal 0
			4'b0001 : out = 7'b1001111; // hexadecimal 1
			4'b0010 : out = 7'b0010010; // hexadecimal 2
			4'b0011 : out = 7'b0000110; // hexadecimal 3
			4'b0100 : out = 7'b1001100; // hexadecimal 4
			4'b0101 : out = 7'b0100100; // hexadecimal 5
			4'b0110 : out = 7'b0100000; // hexadecimal 6
			4'b0111 : out = 7'b0001111; // hexadecimal 7
			4'b1000 : out = 7'b0000000; // hexadecimal 8
			4'b1001 : out = 7'b0000100; // hexadecimal 9 
			4'b1010 : out = 7'b0001000; // hexadecimal A
			4'b1011 : out = 7'b1100000; // hexadecimal B
			4'b1100 : out = 7'b0110001; // hexadecimal C
			4'b1101 : out = 7'b1000010; // hexadecimal D
			4'b1110 : out = 7'b0110000; // hexadecimal E
			4'b1111 : out = 7'b0111000; // hexadecimal F
			default : out = 7'b1111110; // default = -
		
		endcase // case statement
		
	// assign out to each individual segment	
	assign {segA, segB, segC, segD, segE, segF, segG} = out; 

endmodule