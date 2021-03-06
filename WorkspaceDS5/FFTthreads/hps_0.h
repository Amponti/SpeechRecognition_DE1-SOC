#ifndef _ALTERA_HPS_0_H_
#define _ALTERA_HPS_0_H_

/*
 * This file was automatically generated by the swinfo2header utility.
 * 
 * Created from SOPC Builder system 'hps_fpga' in
 * file './hps_fpga.sopcinfo'.
 */

/*
 * This file contains macros for module 'hps_0' and devices
 * connected to the following masters:
 *   h2f_axi_master
 *   h2f_lw_axi_master
 * 
 * Do not include this header file and another header file created for a
 * different module or master group at the same time.
 * Doing so may result in duplicate macro names.
 * Instead, use the system header file which has macros with unique names.
 */

/*
 * Macros for device 'audio_r', class 'altera_avalon_pio'
 * The macros are prefixed with 'AUDIO_R_'.
 * The prefix is the slave descriptor.
 */
#define AUDIO_R_COMPONENT_TYPE altera_avalon_pio
#define AUDIO_R_COMPONENT_NAME audio_r
#define AUDIO_R_BASE 0x0
#define AUDIO_R_SPAN 32
#define AUDIO_R_END 0x1f
#define AUDIO_R_BIT_CLEARING_EDGE_REGISTER 0
#define AUDIO_R_BIT_MODIFYING_OUTPUT_REGISTER 0
#define AUDIO_R_CAPTURE 0
#define AUDIO_R_DATA_WIDTH 16
#define AUDIO_R_DO_TEST_BENCH_WIRING 0
#define AUDIO_R_DRIVEN_SIM_VALUE 0
#define AUDIO_R_EDGE_TYPE NONE
#define AUDIO_R_FREQ 50000000
#define AUDIO_R_HAS_IN 1
#define AUDIO_R_HAS_OUT 0
#define AUDIO_R_HAS_TRI 0
#define AUDIO_R_IRQ_TYPE NONE
#define AUDIO_R_RESET_VALUE 0

/*
 * Macros for device 'sw', class 'altera_avalon_pio'
 * The macros are prefixed with 'SW_'.
 * The prefix is the slave descriptor.
 */
#define SW_COMPONENT_TYPE altera_avalon_pio
#define SW_COMPONENT_NAME sw
#define SW_BASE 0x0
#define SW_SPAN 32
#define SW_END 0x1f
#define SW_BIT_CLEARING_EDGE_REGISTER 0
#define SW_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SW_CAPTURE 0
#define SW_DATA_WIDTH 10
#define SW_DO_TEST_BENCH_WIRING 0
#define SW_DRIVEN_SIM_VALUE 0
#define SW_EDGE_TYPE NONE
#define SW_FREQ 50000000
#define SW_HAS_IN 1
#define SW_HAS_OUT 0
#define SW_HAS_TRI 0
#define SW_IRQ_TYPE NONE
#define SW_RESET_VALUE 0

/*
 * Macros for device 'audio_l', class 'altera_avalon_pio'
 * The macros are prefixed with 'AUDIO_L_'.
 * The prefix is the slave descriptor.
 */
#define AUDIO_L_COMPONENT_TYPE altera_avalon_pio
#define AUDIO_L_COMPONENT_NAME audio_l
#define AUDIO_L_BASE 0x10
#define AUDIO_L_SPAN 32
#define AUDIO_L_END 0x2f
#define AUDIO_L_BIT_CLEARING_EDGE_REGISTER 0
#define AUDIO_L_BIT_MODIFYING_OUTPUT_REGISTER 0
#define AUDIO_L_CAPTURE 0
#define AUDIO_L_DATA_WIDTH 16
#define AUDIO_L_DO_TEST_BENCH_WIRING 0
#define AUDIO_L_DRIVEN_SIM_VALUE 0
#define AUDIO_L_EDGE_TYPE NONE
#define AUDIO_L_FREQ 50000000
#define AUDIO_L_HAS_IN 1
#define AUDIO_L_HAS_OUT 0
#define AUDIO_L_HAS_TRI 0
#define AUDIO_L_IRQ_TYPE NONE
#define AUDIO_L_RESET_VALUE 0

/*
 * Macros for device 'led', class 'altera_avalon_pio'
 * The macros are prefixed with 'LED_'.
 * The prefix is the slave descriptor.
 */
#define LED_COMPONENT_TYPE altera_avalon_pio
#define LED_COMPONENT_NAME led
#define LED_BASE 0x10
#define LED_SPAN 32
#define LED_END 0x2f
#define LED_BIT_CLEARING_EDGE_REGISTER 0
#define LED_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LED_CAPTURE 0
#define LED_DATA_WIDTH 10
#define LED_DO_TEST_BENCH_WIRING 0
#define LED_DRIVEN_SIM_VALUE 0
#define LED_EDGE_TYPE NONE
#define LED_FREQ 50000000
#define LED_HAS_IN 0
#define LED_HAS_OUT 1
#define LED_HAS_TRI 0
#define LED_IRQ_TYPE NONE
#define LED_RESET_VALUE 1023

/*
 * Macros for device 'key', class 'altera_avalon_pio'
 * The macros are prefixed with 'KEY_'.
 * The prefix is the slave descriptor.
 */
#define KEY_COMPONENT_TYPE altera_avalon_pio
#define KEY_COMPONENT_NAME key
#define KEY_BASE 0x20
#define KEY_SPAN 32
#define KEY_END 0x3f
#define KEY_BIT_CLEARING_EDGE_REGISTER 0
#define KEY_BIT_MODIFYING_OUTPUT_REGISTER 0
#define KEY_CAPTURE 0
#define KEY_DATA_WIDTH 4
#define KEY_DO_TEST_BENCH_WIRING 0
#define KEY_DRIVEN_SIM_VALUE 0
#define KEY_EDGE_TYPE NONE
#define KEY_FREQ 50000000
#define KEY_HAS_IN 1
#define KEY_HAS_OUT 0
#define KEY_HAS_TRI 0
#define KEY_IRQ_TYPE NONE
#define KEY_RESET_VALUE 0


#endif /* _ALTERA_HPS_0_H_ */
