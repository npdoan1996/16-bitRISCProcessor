`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:21:44 11/04/2018 
// Design Name: 
// Module Name:    debounce 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module debounce(clk, reset, step, step_debounce);
	input 	clk, reset, step;
	output	step_debounce;
	
	wire		clk_out;

	clk_div			 //(clk_in, reset, clk_out)
		clk_500Hz		(clk, reset, clk_out);
	
	one_shot			 //(D_in, D_out, reset, clk_in)
		debounceStep	(step, step_debounce, reset, clk_out);


endmodule
