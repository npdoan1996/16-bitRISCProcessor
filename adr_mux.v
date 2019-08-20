`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  adr_mux.v
 * Project:    Lab_Assignment_7
 * Designer:   Nguyen Doan
 * Email:      npdoan1996@gmail.com
 * Rev. No.:   Version 1.2
 * Rev. Date:  11/9/2018
 *
 * Purpose: 	This module is a 16-bitwise 2 to 1 multiplexer. When Sel is 
 *					high, adr gets adr1. When Sel is low, adr get adr 0.
 *   
 *
 ****************************************************************************/
module adr_mux(Sel, adr0, adr1, adr);

	// Declare inputs and outputs
	input 			Sel;
	input   [15:0] adr0, adr1;
	output  [15:0] adr;
	wire 	  [15:0] adr;
	
	assign	adr = (Sel == 1'b1)? adr1 : adr0; 
	
endmodule
