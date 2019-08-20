`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  decoder_3to8.v
 * Project:    Lab_Assignment_5
 * Designer:   Nguyen Doan
 * Email:      npdoan1996@gmail.com
 * Rev. No.:   Version 1.0
 * Rev. Date:  10/24/2018
 *
 * Purpose:		This module is a decoder used to receive the 3 bit address input
 *					and "decode" that address to the appropriate register. A decoder
 *					is the preferred method to pick the register because of mutual 
 *					exclusion meaning only one ouput will be asserted from decoder.
 *					       
 ****************************************************************************/
module decoder_3to8(in, en, y);
	
	// Declare Inputs and Outputs
	input   [2:0]	in;
	input 			en;
	output  [7:0]	y;
	
	reg 	  [7:0]	y;
	always @ (*)
		if (en == 1'b0)
			y = 8'b0;
		else 
			case (in)
			3'b000: 	y = 8'b0000_0001;
			3'b001: 	y = 8'b0000_0010;
			3'b010: 	y = 8'b0000_0100;
			3'b011:  y = 8'b0000_1000;
			3'b100:  y = 8'b0001_0000;
			3'b101:  y = 8'b0010_0000;
			3'b110:  y = 8'b0100_0000;
			3'b111:  y = 8'b1000_0000;
			default: y = 8'b0000_0000;
			endcase
endmodule

