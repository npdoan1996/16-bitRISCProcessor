`timescale 1ns / 1ps
/****************************** C E C S  3 0 1 ******************************
 * 
 * File Name:  CPU_EU.v
 * Project:    Lab_Assignment_7
 * Designer:   Nguyen Doan	
 * Email:      npdoan1996@gmail.com
 * Rev. No.:   Version 1.2
 * Rev. Date:  11/9/2018
 *
 * Purpose: 	 
 *					
 *      
 *
 ****************************************************************************/
module CPU_EU(clk, reset, adr_sel, s_sel, pc_load, pc_inc, w_en, pc_sel,
				  ir_load, W_Adr, R_Adr, S_Adr, Alu_Op,  
				  IR_out, D_in, D_out, Address, N, Z, C);

	// Declare inputs and outputs
	input 			clk, reset, adr_sel, s_sel, pc_load, 
						pc_inc, w_en, pc_sel, ir_load;
	input   [2:0] 	W_Adr, R_Adr, S_Adr;
	input   [3:0]  Alu_Op;
	input  [15:0]	D_in;
	output			N, Z, C;
	output [15:0]	D_out, Address, IR_out;
	
	wire   [15:0] 	R_out, IR, PC_out, A_out, PC_mux_out, BitExt, JumpPos; 
	
	IntegerDataPath
		InDatapath (clk, reset, w_en, Alu_Op, W_Adr, R_Adr, S_Adr,
						D_in, s_sel, R_out, A_out, N, Z, C);
	
	Reg16_inc_ld
				  InstR (D_in,  	  IR, clk, reset,  1'b0, ir_load),
				  ProgC (PC_mux_out, PC_out, clk, reset, pc_inc, pc_load); 
	
	assign BitExt = {{8{IR[7]}}, IR[7:0]};
	assign JumpPos = PC_out + BitExt;
	assign D_out = A_out;
	assign PC_mux_out = (pc_sel) ? A_out : JumpPos;
	assign Address = (adr_sel) ? R_out : PC_out;
	assign IR_out = IR;

endmodule
