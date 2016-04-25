//scfifo ADD_RAM_OUTPUT_REGISTER="OFF" ALMOST_EMPTY_VALUE=200 ALMOST_FULL_VALUE=60000 CBX_SINGLE_OUTPUT_FILE="ON" INTENDED_DEVICE_FAMILY=""Cyclone V"" LPM_NUMWORDS=8192 LPM_SHOWAHEAD="OFF" LPM_TYPE="scfifo" LPM_WIDTH=16 LPM_WIDTHU=13 OVERFLOW_CHECKING="ON" UNDERFLOW_CHECKING="ON" USE_EAB="ON" aclr almost_empty almost_full clock data empty full q rdreq usedw wrreq
//VERSION_BEGIN 15.0 cbx_mgl 2015:04:22:18:06:50:SJ cbx_stratixii 2015:04:22:18:04:08:SJ cbx_util_mgl 2015:04:22:18:04:08:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, the Altera Quartus II License Agreement,
//  the Altera MegaCore Function License Agreement, or other 
//  applicable license agreement, including, without limitation, 
//  that your use is for the sole purpose of programming logic 
//  devices manufactured by Altera and sold by Altera or its 
//  authorized distributors.  Please refer to the applicable 
//  agreement for further details.



//synthesis_resources = scfifo 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mgpc11
	( 
	aclr,
	almost_empty,
	almost_full,
	clock,
	data,
	empty,
	full,
	q,
	rdreq,
	usedw,
	wrreq) /* synthesis synthesis_clearbox=1 */;
	input   aclr;
	output   almost_empty;
	output   almost_full;
	input   clock;
	input   [15:0]  data;
	output   empty;
	output   full;
	output   [15:0]  q;
	input   rdreq;
	output   [12:0]  usedw;
	input   wrreq;

	wire  wire_mgl_prim1_almost_empty;
	wire  wire_mgl_prim1_almost_full;
	wire  wire_mgl_prim1_empty;
	wire  wire_mgl_prim1_full;
	wire  [15:0]   wire_mgl_prim1_q;
	wire  [12:0]   wire_mgl_prim1_usedw;

	scfifo   mgl_prim1
	( 
	.aclr(aclr),
	.almost_empty(wire_mgl_prim1_almost_empty),
	.almost_full(wire_mgl_prim1_almost_full),
	.clock(clock),
	.data(data),
	.empty(wire_mgl_prim1_empty),
	.full(wire_mgl_prim1_full),
	.q(wire_mgl_prim1_q),
	.rdreq(rdreq),
	.usedw(wire_mgl_prim1_usedw),
	.wrreq(wrreq));
	defparam
		mgl_prim1.add_ram_output_register = "OFF",
		mgl_prim1.almost_empty_value = 200,
		mgl_prim1.almost_full_value = 60000,
		mgl_prim1.intended_device_family = ""Cyclone V"",
		mgl_prim1.lpm_numwords = 8192,
		mgl_prim1.lpm_showahead = "OFF",
		mgl_prim1.lpm_type = "scfifo",
		mgl_prim1.lpm_width = 16,
		mgl_prim1.lpm_widthu = 13,
		mgl_prim1.overflow_checking = "ON",
		mgl_prim1.underflow_checking = "ON",
		mgl_prim1.use_eab = "ON";
	assign
		almost_empty = wire_mgl_prim1_almost_empty,
		almost_full = wire_mgl_prim1_almost_full,
		empty = wire_mgl_prim1_empty,
		full = wire_mgl_prim1_full,
		q = wire_mgl_prim1_q,
		usedw = wire_mgl_prim1_usedw;
endmodule //mgpc11
//VALID FILE
