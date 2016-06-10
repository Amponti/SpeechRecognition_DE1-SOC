// ============================================================================
// Copyright (c) 2013 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Mon Jun 17 20:35:29 2013
// ============================================================================

`define ENABLE_HPS

module DE1_SoC_Audio(

      ///////// ADC /////////
      inout              ADC_CS_N,
      output             ADC_DIN,
      input              ADC_DOUT,
      output             ADC_SCLK,

      ///////// AUD /////////
      input              AUD_ADCDAT,
      inout              AUD_ADCLRCK,
      inout              AUD_BCLK,
      output             AUD_DACDAT,
      inout              AUD_DACLRCK,
      output             AUD_XCK,

      ///////// CLOCK2 /////////
      input              CLOCK2_50,

      ///////// CLOCK3 /////////
      input              CLOCK3_50,

      ///////// CLOCK4 /////////
      input              CLOCK4_50,

      ///////// CLOCK /////////
      input              CLOCK_50,

      ///////// DRAM /////////
      output      [12:0] DRAM_ADDR,
      output      [1:0]  DRAM_BA,
      output             DRAM_CAS_N,
      output             DRAM_CKE,
      output             DRAM_CLK,
      output             DRAM_CS_N,
      inout       [15:0] DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_RAS_N,
      output             DRAM_UDQM,
      output             DRAM_WE_N,

      ///////// FAN /////////
      output             FAN_CTRL,

      ///////// FPGA /////////
      output             FPGA_I2C_SCLK,
      inout              FPGA_I2C_SDAT,

      ///////// GPIO /////////
      inout     [35:0]   GPIO_0,
      inout     [35:0]   GPIO_1,
 
      ///////// HEX0 /////////
      output      [6:0]  HEX0,

      ///////// HEX1 /////////
      output      [6:0]  HEX1,

      ///////// HEX2 /////////
      output      [6:0]  HEX2,

      ///////// HEX3 /////////
      output      [6:0]  HEX3,

      ///////// HEX4 /////////
      output      [6:0]  HEX4,

      ///////// HEX5 /////////
      output      [6:0]  HEX5,

`ifdef ENABLE_HPS
      ///////// HPS /////////
      inout              HPS_CONV_USB_N,
      output      [14:0] HPS_DDR3_ADDR,
      output      [2:0]  HPS_DDR3_BA,
      output             HPS_DDR3_CAS_N,
      output             HPS_DDR3_CKE,
      output             HPS_DDR3_CK_N,
      output             HPS_DDR3_CK_P,
      output             HPS_DDR3_CS_N,
      output      [3:0]  HPS_DDR3_DM,
      inout       [31:0] HPS_DDR3_DQ,
      inout       [3:0]  HPS_DDR3_DQS_N,
      inout       [3:0]  HPS_DDR3_DQS_P,
      output             HPS_DDR3_ODT,
      output             HPS_DDR3_RAS_N,
      output             HPS_DDR3_RESET_N,
      input              HPS_DDR3_RZQ,
      output             HPS_DDR3_WE_N,
      output             HPS_ENET_GTX_CLK,
      inout              HPS_ENET_INT_N,
      output             HPS_ENET_MDC,
      inout              HPS_ENET_MDIO,
      input              HPS_ENET_RX_CLK,
      input       [3:0]  HPS_ENET_RX_DATA,
      input              HPS_ENET_RX_DV,
      output      [3:0]  HPS_ENET_TX_DATA,
      output             HPS_ENET_TX_EN,
      inout       [3:0]  HPS_FLASH_DATA,
      output             HPS_FLASH_DCLK,
      output             HPS_FLASH_NCSO,
      inout              HPS_GSENSOR_INT,
      inout              HPS_I2C1_SCLK,
      inout              HPS_I2C1_SDAT,
      inout              HPS_I2C2_SCLK,
      inout              HPS_I2C2_SDAT,
      inout              HPS_I2C_CONTROL,
      inout              HPS_KEY,
      inout              HPS_LED,
      inout              HPS_LTC_GPIO,
      output             HPS_SD_CLK,
      inout              HPS_SD_CMD,
      inout       [3:0]  HPS_SD_DATA,
      output             HPS_SPIM_CLK,
      input              HPS_SPIM_MISO,
      output             HPS_SPIM_MOSI,
      inout              HPS_SPIM_SS,
      input              HPS_UART_RX,
      output             HPS_UART_TX,
      input              HPS_USB_CLKOUT,
      inout       [7:0]  HPS_USB_DATA,
      input              HPS_USB_DIR,
      input              HPS_USB_NXT,
      output             HPS_USB_STP,
`endif /*ENABLE_HPS*/

      ///////// IRDA /////////
      input              IRDA_RXD,
      output             IRDA_TXD,

      ///////// KEY /////////
      input       [3:0]  KEY,

      ///////// LEDR /////////
      output      [9:0]  LEDR,

      ///////// PS2 /////////
      inout              PS2_CLK,
      inout              PS2_CLK2,
      inout              PS2_DAT,
      inout              PS2_DAT2,

      ///////// SW /////////
      input       [9:0]  SW,

      ///////// TD /////////
      input              TD_CLK27,
      input      [7:0]  TD_DATA,
      input             TD_HS,
      output             TD_RESET_N,
      input             TD_VS,

      ///////// VGA /////////
      output      [7:0]  VGA_B,
      output             VGA_BLANK_N,
      output             VGA_CLK,
      output      [7:0]  VGA_G,
      output             VGA_HS,
      output      [7:0]  VGA_R,
      output             VGA_SYNC_N,
      output             VGA_VS
);


//=======================================================
//  REG/WIRE declarations
//=======================================================
wire HEX0P;
wire HEX1P;
wire HEX2P;
wire HEX3P;
wire HEX4P;
wire HEX5P;

wire reset_n;
assign reset_n = 1'b1;

wire [31:0]audio_dac_arm;
wire read_arm;
wire empty_arm;
wire [9:0]config_audio;
wire record;
wire play;

//=======================================================
//  Structural coding
//=======================================================


audio_nios CoAudio(

		.clk_clk                                (CLOCK_50),                           // clk.clk
		.reset_reset_n                          (reset_n),                      		// reset.reset_n
		.pll_sdam_clk                           (DRAM_CLK),                       		// pll_sdam.clk
		
		.key_external_connection_export         ({record,play,KEY[1:0]}),     			// key_external_connection.export
		.seg7_conduit_end_export                ({
                                              HEX5P, HEX5, HEX4P, HEX4, 
                                              HEX3P, HEX3, HEX2P, HEX2,
                                              HEX1P, HEX1, HEX0P, HEX0}),           // seg7_conduit_end.export
//		.pio_0_external_connection_export       (),   											// pio_0_external_connection.export
		.sw_external_connection_export          (config_audio[9:0]),      				// sw_external_connection.export
		
		.i2c_scl_external_connection_export     (FPGA_I2C_SCLK), 							// i2c_scl_external_connection.export
		.i2c_sda_external_connection_export     (FPGA_I2C_SDAT), 							// i2c_sda_external_connection.export
/*		
		.audio_conduit_end_XCK                  (AUD_XCK),              					// audio_conduit_end.XCK
		.audio_conduit_end_ADCDAT               (AUD_ADCDAT),           					// .ADCDAT
		.audio_conduit_end_ADCLRC               (AUD_ADCLRCK),           					// .ADCLRC
		.audio_conduit_end_DACDAT               (AUD_DACDAT),           					// .DACDAT
		.audio_conduit_end_DACLRC               (AUD_DACLRCK),           					// .DACLRC
		.audio_conduit_end_BCLK                 (AUD_BCLK),             					// .BCLK
*/	
		.audio_conduit_end_avs_s1_export_xck    (AUD_XCK),    								// audio_conduit_end.avs_s1_export_xck
		.audio_conduit_end_avs_s1_export_adcdat (AUD_ADCDAT), 								// .avs_s1_export_adcdat
		.audio_conduit_end_avs_s1_export_adclrc (AUD_ADCLRCK),								// .avs_s1_export_adclrc
		.audio_conduit_end_avs_s1_export_dacdat (AUD_DACDAT), 								// .avs_s1_export_dacdat
		.audio_conduit_end_avs_s1_export_daclrc (AUD_DACLRCK),								// .avs_s1_export_daclrc
		.audio_conduit_end_avs_s1_export_bclk   (AUD_BCLK),   								// .avs_s1_export_bclk
		.audio_conduit_end_arm_data_read        (audio_dac_arm[31:0]),        			// .arm_data_read
		.audio_conduit_end_arm_read             (read_arm),             					// .arm_read
		.audio_conduit_end_dacfifo_empty        (empty_arm),        						// .dacfifo_empty
   
		.sdram_wire_addr                        (DRAM_ADDR),                    		// sdram_wire.addr
		.sdram_wire_ba                          (DRAM_BA),                      		// .ba
		.sdram_wire_cas_n                       (DRAM_CAS_N),                   		// .cas_n
		.sdram_wire_cke                         (DRAM_CKE),                     		// .cke
		.sdram_wire_cs_n                        (DRAM_CS_N),                    		// .cs_n
		.sdram_wire_dq                          (DRAM_DQ),                      		// .dq
		.sdram_wire_dqm                         ({DRAM_UDQM,DRAM_LDQM}),              // .dqm
		.sdram_wire_ras_n                       (DRAM_RAS_N),                   		// .ras_n
		.sdram_wire_we_n                        (DRAM_WE_N)                    			// .we_n	
	);

// HPS_FPGA //
hps_fpga ARM
(
	.clk_clk                         			(CLOCK_50),                      		// clk.clk
	.hps_h2f_reset_reset_n         				(HPS_H2F_RST),         						// hps_0_h2f_reset.reset_n
	.key_external_connection_export  			(KEY),  											// key_external_connection.export
	.led_external_connection_export  			(LEDR[9:0]),  									// led_external_connection.export
	.sw_external_connection_export   			(SW),   											//  sw_external_connection.export
	.audio_external_export 							(audio_dac_arm[31:0]), 						// audio_l_external_connection.export
	.fifo_empty_external_export      			(empty_arm),      	 						// fifo_empty_external.export
	.fifo_read_external_export       			(read_arm),       							// fifo_clk_external.export
	.play_d_external_export          			(play),          								// play_d_external.export
	.record_d_external_export        			(record),
	.config_audio_external_export    			(config_audio[9:0]),
	.memory_mem_a                    			(HPS_DDR3_ADDR),                 		// memory.mem_a
	.memory_mem_ba                   			(HPS_DDR3_BA),                   		// .mem_ba
	.memory_mem_ck                   			(HPS_DDR3_CK_P),                 		// .mem_ck
	.memory_mem_ck_n                 			(HPS_DDR3_CK_N),                 		// .mem_ck_n
	.memory_mem_cke                  			(HPS_DDR3_CKE),                  		// .mem_cke
	.memory_mem_cs_n                 			(HPS_DDR3_CS_N),                 		// .mem_cs_n
	.memory_mem_ras_n                			(HPS_DDR3_RAS_N),                		// .mem_ras_n
	.memory_mem_cas_n                			(HPS_DDR3_CAS_N),                		// .mem_cas_n
	.memory_mem_we_n                 			(HPS_DDR3_WE_N),                 		// .mem_we_n
	.memory_mem_reset_n              			(HPS_DDR3_RESET_N),              		// .mem_reset_n
	.memory_mem_dq                   			(HPS_DDR3_DQ),                   		// .mem_dq
	.memory_mem_dqs                  			(HPS_DDR3_DQS_P),                		// .mem_dqs
	.memory_mem_dqs_n                			(HPS_DDR3_DQS_N),                		// .mem_dqs_n
	.memory_mem_odt                  			(HPS_DDR3_ODT),                  		// .mem_odt
	.memory_mem_dm                   			(HPS_DDR3_DM),                   		// .mem_dm
	.memory_oct_rzqin                			(HPS_DDR3_RZQ),                			// .oct_rzqin
	.reset_reset_n                   			(1'b1),                   					// reset.reset_n
	.hps_io_hps_io_emac1_inst_TX_CLK 			(HPS_ENET_GTX_CLK), 							// hps_io.hps_io_emac1_inst_TX_CLK
	.hps_io_hps_io_emac1_inst_TXD0   			(HPS_ENET_TX_DATA[0]),   					// .hps_io_emac1_inst_TXD0
	.hps_io_hps_io_emac1_inst_TXD1   			(HPS_ENET_TX_DATA[1]),   					// .hps_io_emac1_inst_TXD1
	.hps_io_hps_io_emac1_inst_TXD2   			(HPS_ENET_TX_DATA[2]),   					// .hps_io_emac1_inst_TXD2
	.hps_io_hps_io_emac1_inst_TXD3   			(HPS_ENET_TX_DATA[3]),   					// .hps_io_emac1_inst_TXD3
	.hps_io_hps_io_emac1_inst_RXD0   			(HPS_ENET_RX_DATA[0]),   					// .hps_io_emac1_inst_RXD0
	.hps_io_hps_io_emac1_inst_RXD1   			(HPS_ENET_RX_DATA[1]),   					// .hps_io_emac1_inst_RXD1
	.hps_io_hps_io_emac1_inst_RXD2   			(HPS_ENET_RX_DATA[2]),   					// .hps_io_emac1_inst_RXD2
	.hps_io_hps_io_emac1_inst_RXD3   			(HPS_ENET_RX_DATA[3]),  					// .hps_io_emac1_inst_RXD3
	.hps_io_hps_io_emac1_inst_MDIO   			(HPS_ENET_MDIO),   							// .hps_io_emac1_inst_MDIO
	.hps_io_hps_io_emac1_inst_MDC    			(HPS_ENET_MDC),    							// .hps_io_emac1_inst_MDC
	.hps_io_hps_io_emac1_inst_RX_CTL 			(HPS_ENET_RX_DV), 							// .hps_io_emac1_inst_RX_CTL
	.hps_io_hps_io_emac1_inst_TX_CTL 			(HPS_ENET_TX_EN), 							// .hps_io_emac1_inst_TX_CTL
	.hps_io_hps_io_emac1_inst_RX_CLK 			(HPS_ENET_RX_CLK), 							// .hps_io_emac1_inst_RX_CLK
	.hps_io_hps_io_sdio_inst_CMD     			(HPS_SD_CMD),     							// .hps_io_sdio_inst_CMD
	.hps_io_hps_io_sdio_inst_D0      			(HPS_SD_DATA[0]),      						// .hps_io_sdio_inst_D0
	.hps_io_hps_io_sdio_inst_D1      			(HPS_SD_DATA[1]),      						// .hps_io_sdio_inst_D1
	.hps_io_hps_io_sdio_inst_D2      			(HPS_SD_DATA[2]),      						// .hps_io_sdio_inst_D2
	.hps_io_hps_io_sdio_inst_D3      			(HPS_SD_DATA[3]),      						// .hps_io_sdio_inst_D3
	.hps_io_hps_io_sdio_inst_CLK     			(HPS_SD_CLK),     							// .hps_io_sdio_inst_CLK
	.hps_io_hps_io_usb1_inst_D0      			(HPS_USB_DATA[0]),      					// .hps_io_usb1_inst_D0
	.hps_io_hps_io_usb1_inst_D1      			(HPS_USB_DATA[1]),      					// .hps_io_usb1_inst_D1
	.hps_io_hps_io_usb1_inst_D2      			(HPS_USB_DATA[2]),      					// .hps_io_usb1_inst_D2
	.hps_io_hps_io_usb1_inst_D3      			(HPS_USB_DATA[3]),      					// .hps_io_usb1_inst_D3
	.hps_io_hps_io_usb1_inst_D4      			(HPS_USB_DATA[4]),      					// .hps_io_usb1_inst_D4
	.hps_io_hps_io_usb1_inst_D5      			(HPS_USB_DATA[5]),      					// .hps_io_usb1_inst_D5
	.hps_io_hps_io_usb1_inst_D6      			(HPS_USB_DATA[6]),      					// .hps_io_usb1_inst_D6
	.hps_io_hps_io_usb1_inst_D7      			(HPS_USB_DATA[7]),      					// .hps_io_usb1_inst_D7
	.hps_io_hps_io_usb1_inst_CLK     			(HPS_USB_CLKOUT),     						// .hps_io_usb1_inst_CLK
	.hps_io_hps_io_usb1_inst_STP     			(HPS_USB_STP),     							// .hps_io_usb1_inst_STP
	.hps_io_hps_io_usb1_inst_DIR     			(HPS_USB_DIR),     							// .hps_io_usb1_inst_DIR
	.hps_io_hps_io_usb1_inst_NXT     			(HPS_USB_NXT),     							// .hps_io_usb1_inst_NXT
	.hps_io_hps_io_uart0_inst_RX     			(HPS_UART_RX),     							// .hps_io_uart0_inst_RX
	.hps_io_hps_io_uart0_inst_TX     			(HPS_UART_TX)     							// .hps_io_uart0_inst_TX
/*	
	.hps_uart1_cts                   			(1'b1),                   					// hps_uart1.cts
	.hps_uart1_dsr                   			(<connected-to-hps_uart1_dsr>),        // .dsr
	.hps_uart1_dcd                   			(<connected-to-hps_uart1_dcd>),        // .dcd
	.hps_uart1_ri                    			(<connected-to-hps_uart1_ri>),         // .ri
	.hps_uart1_dtr                   			(<connected-to-hps_uart1_dtr>),        // .dtr
	.hps_uart1_rts                   			(<connected-to-hps_uart1_rts>),        // .rts
	.hps_uart1_out1_n                			(<connected-to-hps_uart1_out1_n>),     // .out1_n
	.hps_uart1_out2_n                			(<connected-to-hps_uart1_out2_n>),     // .out2_n
	.hps_uart1_rxd                   			(<connected-to-hps_uart1_rxd>),        // .rxd
	.hps_uart1_txd                   			(<connected-to-hps_uart1_txd>) 			// .txd
*/
);

endmodule
