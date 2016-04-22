// Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
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


// Generated by Quartus II 64-Bit Version 14.1 (Build Build 186 12/03/2014)
// Created on Mon Aug 17 16:02:13 2015

AUDIO_DAC_ADC AUDIO_DAC_ADC_inst
(
	.oAUD_BCK(oAUD_BCK_sig) ,	// output  oAUD_BCK_sig
	.oAUD_DATA(oAUD_DATA_sig) ,	// output  oAUD_DATA_sig
	.oAUD_LRCK(oAUD_LRCK_sig) ,	// output  oAUD_LRCK_sig
	.oAUD_inL(oAUD_inL_sig) ,	// output [DATA_WIDTH-1:0] oAUD_inL_sig
	.oAUD_inR(oAUD_inR_sig) ,	// output [DATA_WIDTH-1:0] oAUD_inR_sig
	.iAUD_ADCDAT(iAUD_ADCDAT_sig) ,	// input  iAUD_ADCDAT_sig
	.iAUD_extR(iAUD_extR_sig) ,	// input [DATA_WIDTH-1:0] iAUD_extR_sig
	.iAUD_extL(iAUD_extL_sig) ,	// input [DATA_WIDTH-1:0] iAUD_extL_sig
	.iCLK_18_4(iCLK_18_4_sig) ,	// input  iCLK_18_4_sig
	.iRST_N(iRST_N_sig) 	// input  iRST_N_sig
);

defparam AUDIO_DAC_ADC_inst.REF_CLK = 18432000;
defparam AUDIO_DAC_ADC_inst.SAMPLE_RATE = 48000;
defparam AUDIO_DAC_ADC_inst.DATA_WIDTH = 16;
defparam AUDIO_DAC_ADC_inst.CHANNEL_NUM = 2;