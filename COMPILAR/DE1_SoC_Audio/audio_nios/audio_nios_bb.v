
module audio_nios (
	altpll_audio_locked_export,
	audio_conduit_end_avs_s1_export_xck,
	audio_conduit_end_avs_s1_export_adcdat,
	audio_conduit_end_avs_s1_export_adclrc,
	audio_conduit_end_avs_s1_export_dacdat,
	audio_conduit_end_avs_s1_export_daclrc,
	audio_conduit_end_avs_s1_export_bclk,
	audio_conduit_end_arm_data_read,
	audio_conduit_end_arm_read,
	audio_conduit_end_dacfifo_empty,
	clk_clk,
	i2c_scl_external_connection_export,
	i2c_sda_external_connection_export,
	key_external_connection_export,
	pio_0_external_connection_export,
	pll_locked_export,
	pll_sdam_clk,
	reset_reset_n,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	seg7_conduit_end_export,
	sw_external_connection_export);	

	output		altpll_audio_locked_export;
	output		audio_conduit_end_avs_s1_export_xck;
	input		audio_conduit_end_avs_s1_export_adcdat;
	input		audio_conduit_end_avs_s1_export_adclrc;
	output		audio_conduit_end_avs_s1_export_dacdat;
	input		audio_conduit_end_avs_s1_export_daclrc;
	input		audio_conduit_end_avs_s1_export_bclk;
	output	[31:0]	audio_conduit_end_arm_data_read;
	input		audio_conduit_end_arm_read;
	output		audio_conduit_end_dacfifo_empty;
	input		clk_clk;
	output		i2c_scl_external_connection_export;
	inout		i2c_sda_external_connection_export;
	input	[3:0]	key_external_connection_export;
	output	[9:0]	pio_0_external_connection_export;
	output		pll_locked_export;
	output		pll_sdam_clk;
	input		reset_reset_n;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	output	[47:0]	seg7_conduit_end_export;
	input	[9:0]	sw_external_connection_export;
endmodule
