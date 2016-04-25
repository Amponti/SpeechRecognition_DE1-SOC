// Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.


// Generated by Quartus II 64-Bit Version 15.0 (Build Build 145 04/22/2015)
// Created on Mon Apr 25 10:28:33 2016

to_slow_clk_interface to_slow_clk_interface_inst
(
	.indata(indata_sig) ,	// input [width-1:0] indata_sig
	.outdata(outdata_sig) ,	// output [width-1:0] outdata_sig
	.inclk(inclk_sig) ,	// input  inclk_sig
	.outclk(outclk_sig) 	// input  outclk_sig
);

defparam to_slow_clk_interface_inst.width = 32;