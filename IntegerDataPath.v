`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  IntegetDatapath.v
 * Project:    Lab_Assignment_7
 * Designer:   Randolph DeLeon	
 * Email:      randolph.deleon@student.csulb.edu
 * Rev. No.:   Version 1.2
 * Rev. Date:  10/13/2018
 *
 * Purpose: 	This module  
 *					 
 *					 
 *      
 *
 ****************************************************************************/
module IntegerDataPath(clk, reset, W_En, ALU_OP, W_Adr, R_Adr, S_Adr, DS, S_Sel,  
								Reg_Out, Alu_Out, N, Z, C);
	
	input 			clk, reset, W_En, S_Sel;
	input		[2:0]	R_Adr, W_Adr, S_Adr;
	input		[3:0]	ALU_OP;
	input	  [15:0] DS;
	output			N, Z, C;
	output  [15:0] Reg_Out, Alu_Out;
	

	wire 	  [15:0] R, S, S_Mux, W, DS;
	
	register_file
		RegFile		(clk, reset, W_En, W_Adr, R_Adr, S_Adr, W, R, S);
		
	assign S_Mux = (S_Sel) ? DS : S;
			
	alu16		 	 //(R, S, Alu_Op, Y, N, Z, C)
			Alu		(R, S_Mux, ALU_OP, W, N, Z, C);
			
	assign Reg_Out = R;
	assign Alu_Out = W;
			
endmodule
