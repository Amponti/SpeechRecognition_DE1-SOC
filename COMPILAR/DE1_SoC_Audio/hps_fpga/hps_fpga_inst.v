	hps_fpga u0 (
		.audio_external_export           (<connected-to-audio_external_export>),           //          audio_external.export
		.clk_clk                         (<connected-to-clk_clk>),                         //                     clk.clk
		.config_audio_external_export    (<connected-to-config_audio_external_export>),    //   config_audio_external.export
		.fifo_empty_external_export      (<connected-to-fifo_empty_external_export>),      //     fifo_empty_external.export
		.fifo_read_external_export       (<connected-to-fifo_read_external_export>),       //      fifo_read_external.export
		.hps_h2f_reset_reset_n           (<connected-to-hps_h2f_reset_reset_n>),           //           hps_h2f_reset.reset_n
		.hps_io_hps_io_emac1_inst_TX_CLK (<connected-to-hps_io_hps_io_emac1_inst_TX_CLK>), //                  hps_io.hps_io_emac1_inst_TX_CLK
		.hps_io_hps_io_emac1_inst_TXD0   (<connected-to-hps_io_hps_io_emac1_inst_TXD0>),   //                        .hps_io_emac1_inst_TXD0
		.hps_io_hps_io_emac1_inst_TXD1   (<connected-to-hps_io_hps_io_emac1_inst_TXD1>),   //                        .hps_io_emac1_inst_TXD1
		.hps_io_hps_io_emac1_inst_TXD2   (<connected-to-hps_io_hps_io_emac1_inst_TXD2>),   //                        .hps_io_emac1_inst_TXD2
		.hps_io_hps_io_emac1_inst_TXD3   (<connected-to-hps_io_hps_io_emac1_inst_TXD3>),   //                        .hps_io_emac1_inst_TXD3
		.hps_io_hps_io_emac1_inst_RXD0   (<connected-to-hps_io_hps_io_emac1_inst_RXD0>),   //                        .hps_io_emac1_inst_RXD0
		.hps_io_hps_io_emac1_inst_MDIO   (<connected-to-hps_io_hps_io_emac1_inst_MDIO>),   //                        .hps_io_emac1_inst_MDIO
		.hps_io_hps_io_emac1_inst_MDC    (<connected-to-hps_io_hps_io_emac1_inst_MDC>),    //                        .hps_io_emac1_inst_MDC
		.hps_io_hps_io_emac1_inst_RX_CTL (<connected-to-hps_io_hps_io_emac1_inst_RX_CTL>), //                        .hps_io_emac1_inst_RX_CTL
		.hps_io_hps_io_emac1_inst_TX_CTL (<connected-to-hps_io_hps_io_emac1_inst_TX_CTL>), //                        .hps_io_emac1_inst_TX_CTL
		.hps_io_hps_io_emac1_inst_RX_CLK (<connected-to-hps_io_hps_io_emac1_inst_RX_CLK>), //                        .hps_io_emac1_inst_RX_CLK
		.hps_io_hps_io_emac1_inst_RXD1   (<connected-to-hps_io_hps_io_emac1_inst_RXD1>),   //                        .hps_io_emac1_inst_RXD1
		.hps_io_hps_io_emac1_inst_RXD2   (<connected-to-hps_io_hps_io_emac1_inst_RXD2>),   //                        .hps_io_emac1_inst_RXD2
		.hps_io_hps_io_emac1_inst_RXD3   (<connected-to-hps_io_hps_io_emac1_inst_RXD3>),   //                        .hps_io_emac1_inst_RXD3
		.hps_io_hps_io_sdio_inst_CMD     (<connected-to-hps_io_hps_io_sdio_inst_CMD>),     //                        .hps_io_sdio_inst_CMD
		.hps_io_hps_io_sdio_inst_D0      (<connected-to-hps_io_hps_io_sdio_inst_D0>),      //                        .hps_io_sdio_inst_D0
		.hps_io_hps_io_sdio_inst_D1      (<connected-to-hps_io_hps_io_sdio_inst_D1>),      //                        .hps_io_sdio_inst_D1
		.hps_io_hps_io_sdio_inst_CLK     (<connected-to-hps_io_hps_io_sdio_inst_CLK>),     //                        .hps_io_sdio_inst_CLK
		.hps_io_hps_io_sdio_inst_D2      (<connected-to-hps_io_hps_io_sdio_inst_D2>),      //                        .hps_io_sdio_inst_D2
		.hps_io_hps_io_sdio_inst_D3      (<connected-to-hps_io_hps_io_sdio_inst_D3>),      //                        .hps_io_sdio_inst_D3
		.hps_io_hps_io_usb1_inst_D0      (<connected-to-hps_io_hps_io_usb1_inst_D0>),      //                        .hps_io_usb1_inst_D0
		.hps_io_hps_io_usb1_inst_D1      (<connected-to-hps_io_hps_io_usb1_inst_D1>),      //                        .hps_io_usb1_inst_D1
		.hps_io_hps_io_usb1_inst_D2      (<connected-to-hps_io_hps_io_usb1_inst_D2>),      //                        .hps_io_usb1_inst_D2
		.hps_io_hps_io_usb1_inst_D3      (<connected-to-hps_io_hps_io_usb1_inst_D3>),      //                        .hps_io_usb1_inst_D3
		.hps_io_hps_io_usb1_inst_D4      (<connected-to-hps_io_hps_io_usb1_inst_D4>),      //                        .hps_io_usb1_inst_D4
		.hps_io_hps_io_usb1_inst_D5      (<connected-to-hps_io_hps_io_usb1_inst_D5>),      //                        .hps_io_usb1_inst_D5
		.hps_io_hps_io_usb1_inst_D6      (<connected-to-hps_io_hps_io_usb1_inst_D6>),      //                        .hps_io_usb1_inst_D6
		.hps_io_hps_io_usb1_inst_D7      (<connected-to-hps_io_hps_io_usb1_inst_D7>),      //                        .hps_io_usb1_inst_D7
		.hps_io_hps_io_usb1_inst_CLK     (<connected-to-hps_io_hps_io_usb1_inst_CLK>),     //                        .hps_io_usb1_inst_CLK
		.hps_io_hps_io_usb1_inst_STP     (<connected-to-hps_io_hps_io_usb1_inst_STP>),     //                        .hps_io_usb1_inst_STP
		.hps_io_hps_io_usb1_inst_DIR     (<connected-to-hps_io_hps_io_usb1_inst_DIR>),     //                        .hps_io_usb1_inst_DIR
		.hps_io_hps_io_usb1_inst_NXT     (<connected-to-hps_io_hps_io_usb1_inst_NXT>),     //                        .hps_io_usb1_inst_NXT
		.hps_io_hps_io_uart0_inst_RX     (<connected-to-hps_io_hps_io_uart0_inst_RX>),     //                        .hps_io_uart0_inst_RX
		.hps_io_hps_io_uart0_inst_TX     (<connected-to-hps_io_hps_io_uart0_inst_TX>),     //                        .hps_io_uart0_inst_TX
		.hps_uart1_cts                   (<connected-to-hps_uart1_cts>),                   //               hps_uart1.cts
		.hps_uart1_dsr                   (<connected-to-hps_uart1_dsr>),                   //                        .dsr
		.hps_uart1_dcd                   (<connected-to-hps_uart1_dcd>),                   //                        .dcd
		.hps_uart1_ri                    (<connected-to-hps_uart1_ri>),                    //                        .ri
		.hps_uart1_dtr                   (<connected-to-hps_uart1_dtr>),                   //                        .dtr
		.hps_uart1_rts                   (<connected-to-hps_uart1_rts>),                   //                        .rts
		.hps_uart1_out1_n                (<connected-to-hps_uart1_out1_n>),                //                        .out1_n
		.hps_uart1_out2_n                (<connected-to-hps_uart1_out2_n>),                //                        .out2_n
		.hps_uart1_rxd                   (<connected-to-hps_uart1_rxd>),                   //                        .rxd
		.hps_uart1_txd                   (<connected-to-hps_uart1_txd>),                   //                        .txd
		.key_external_connection_export  (<connected-to-key_external_connection_export>),  // key_external_connection.export
		.led_external_connection_export  (<connected-to-led_external_connection_export>),  // led_external_connection.export
		.memory_mem_a                    (<connected-to-memory_mem_a>),                    //                  memory.mem_a
		.memory_mem_ba                   (<connected-to-memory_mem_ba>),                   //                        .mem_ba
		.memory_mem_ck                   (<connected-to-memory_mem_ck>),                   //                        .mem_ck
		.memory_mem_ck_n                 (<connected-to-memory_mem_ck_n>),                 //                        .mem_ck_n
		.memory_mem_cke                  (<connected-to-memory_mem_cke>),                  //                        .mem_cke
		.memory_mem_cs_n                 (<connected-to-memory_mem_cs_n>),                 //                        .mem_cs_n
		.memory_mem_ras_n                (<connected-to-memory_mem_ras_n>),                //                        .mem_ras_n
		.memory_mem_cas_n                (<connected-to-memory_mem_cas_n>),                //                        .mem_cas_n
		.memory_mem_we_n                 (<connected-to-memory_mem_we_n>),                 //                        .mem_we_n
		.memory_mem_reset_n              (<connected-to-memory_mem_reset_n>),              //                        .mem_reset_n
		.memory_mem_dq                   (<connected-to-memory_mem_dq>),                   //                        .mem_dq
		.memory_mem_dqs                  (<connected-to-memory_mem_dqs>),                  //                        .mem_dqs
		.memory_mem_dqs_n                (<connected-to-memory_mem_dqs_n>),                //                        .mem_dqs_n
		.memory_mem_odt                  (<connected-to-memory_mem_odt>),                  //                        .mem_odt
		.memory_mem_dm                   (<connected-to-memory_mem_dm>),                   //                        .mem_dm
		.memory_oct_rzqin                (<connected-to-memory_oct_rzqin>),                //                        .oct_rzqin
		.reset_reset_n                   (<connected-to-reset_reset_n>),                   //                   reset.reset_n
		.sw_external_connection_export   (<connected-to-sw_external_connection_export>),   //  sw_external_connection.export
		.record_d_external_export        (<connected-to-record_d_external_export>),        //       record_d_external.export
		.play_d_external_export          (<connected-to-play_d_external_export>)           //         play_d_external.export
	);

