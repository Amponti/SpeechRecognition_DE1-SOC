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
 * Macros for device 'led', class 'altera_avalon_pio'
 * The macros are prefixed with 'LED_'.
 * The prefix is the slave descriptor.
 */
#define LED_COMPONENT_TYPE altera_avalon_pio
#define LED_COMPONENT_NAME led
#define LED_BASE 0x0
#define LED_SPAN 32
#define LED_END 0x1f
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
 * Macros for device 'sw', class 'altera_avalon_pio'
 * The macros are prefixed with 'SW_'.
 * The prefix is the slave descriptor.
 */
#define SW_COMPONENT_TYPE altera_avalon_pio
#define SW_COMPONENT_NAME sw
#define SW_BASE 0x10
#define SW_SPAN 32
#define SW_END 0x2f
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

/*
 * Macros for device 'gettick', class 'altera_avalon_pio'
 * The macros are prefixed with 'GETTICK_'.
 * The prefix is the slave descriptor.
 */
#define GETTICK_COMPONENT_TYPE altera_avalon_pio
#define GETTICK_COMPONENT_NAME gettick
#define GETTICK_BASE 0x30
#define GETTICK_SPAN 32
#define GETTICK_END 0x4f
#define GETTICK_BIT_CLEARING_EDGE_REGISTER 0
#define GETTICK_BIT_MODIFYING_OUTPUT_REGISTER 0
#define GETTICK_CAPTURE 0
#define GETTICK_DATA_WIDTH 32
#define GETTICK_DO_TEST_BENCH_WIRING 0
#define GETTICK_DRIVEN_SIM_VALUE 0
#define GETTICK_EDGE_TYPE NONE
#define GETTICK_FREQ 50000000
#define GETTICK_HAS_IN 1
#define GETTICK_HAS_OUT 0
#define GETTICK_HAS_TRI 0
#define GETTICK_IRQ_TYPE NONE
#define GETTICK_RESET_VALUE 0

/*
 * Macros for device 'audio', class 'AUDIO_IF'
 * The macros are prefixed with 'AUDIO_'.
 * The prefix is the slave descriptor.
 */
#define AUDIO_COMPONENT_TYPE AUDIO_IF
#define AUDIO_COMPONENT_NAME audio
#define AUDIO_BASE 0x40
#define AUDIO_SPAN 64
#define AUDIO_END 0x7f

/*
 * Macros for device 'timer_start', class 'altera_avalon_pio'
 * The macros are prefixed with 'TIMER_START_'.
 * The prefix is the slave descriptor.
 */
#define TIMER_START_COMPONENT_TYPE altera_avalon_pio
#define TIMER_START_COMPONENT_NAME timer_start
#define TIMER_START_BASE 0x60
#define TIMER_START_SPAN 32
#define TIMER_START_END 0x7f
#define TIMER_START_BIT_CLEARING_EDGE_REGISTER 0
#define TIMER_START_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TIMER_START_CAPTURE 0
#define TIMER_START_DATA_WIDTH 1
#define TIMER_START_DO_TEST_BENCH_WIRING 0
#define TIMER_START_DRIVEN_SIM_VALUE 0
#define TIMER_START_EDGE_TYPE NONE
#define TIMER_START_FREQ 50000000
#define TIMER_START_HAS_IN 0
#define TIMER_START_HAS_OUT 1
#define TIMER_START_HAS_TRI 0
#define TIMER_START_IRQ_TYPE NONE
#define TIMER_START_RESET_VALUE 0

/*
 * Macros for device 'timer_div', class 'altera_avalon_pio'
 * The macros are prefixed with 'TIMER_DIV_'.
 * The prefix is the slave descriptor.
 */
#define TIMER_DIV_COMPONENT_TYPE altera_avalon_pio
#define TIMER_DIV_COMPONENT_NAME timer_div
#define TIMER_DIV_BASE 0x70
#define TIMER_DIV_SPAN 32
#define TIMER_DIV_END 0x8f
#define TIMER_DIV_BIT_CLEARING_EDGE_REGISTER 0
#define TIMER_DIV_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TIMER_DIV_CAPTURE 0
#define TIMER_DIV_DATA_WIDTH 32
#define TIMER_DIV_DO_TEST_BENCH_WIRING 0
#define TIMER_DIV_DRIVEN_SIM_VALUE 0
#define TIMER_DIV_EDGE_TYPE NONE
#define TIMER_DIV_FREQ 50000000
#define TIMER_DIV_HAS_IN 0
#define TIMER_DIV_HAS_OUT 1
#define TIMER_DIV_HAS_TRI 0
#define TIMER_DIV_IRQ_TYPE NONE
#define TIMER_DIV_RESET_VALUE 0

/*
 * Macros for device 'i2c_scl', class 'altera_avalon_pio'
 * The macros are prefixed with 'I2C_SCL_'.
 * The prefix is the slave descriptor.
 */
#define I2C_SCL_COMPONENT_TYPE altera_avalon_pio
#define I2C_SCL_COMPONENT_NAME i2c_scl
#define I2C_SCL_BASE 0x80
#define I2C_SCL_SPAN 32
#define I2C_SCL_END 0x9f
#define I2C_SCL_BIT_CLEARING_EDGE_REGISTER 0
#define I2C_SCL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I2C_SCL_CAPTURE 0
#define I2C_SCL_DATA_WIDTH 1
#define I2C_SCL_DO_TEST_BENCH_WIRING 0
#define I2C_SCL_DRIVEN_SIM_VALUE 0
#define I2C_SCL_EDGE_TYPE NONE
#define I2C_SCL_FREQ 50000000
#define I2C_SCL_HAS_IN 0
#define I2C_SCL_HAS_OUT 1
#define I2C_SCL_HAS_TRI 0
#define I2C_SCL_IRQ_TYPE NONE
#define I2C_SCL_RESET_VALUE 0

/*
 * Macros for device 'i2c_sda', class 'altera_avalon_pio'
 * The macros are prefixed with 'I2C_SDA_'.
 * The prefix is the slave descriptor.
 */
#define I2C_SDA_COMPONENT_TYPE altera_avalon_pio
#define I2C_SDA_COMPONENT_NAME i2c_sda
#define I2C_SDA_BASE 0x90
#define I2C_SDA_SPAN 32
#define I2C_SDA_END 0xaf
#define I2C_SDA_BIT_CLEARING_EDGE_REGISTER 0
#define I2C_SDA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I2C_SDA_CAPTURE 0
#define I2C_SDA_DATA_WIDTH 1
#define I2C_SDA_DO_TEST_BENCH_WIRING 0
#define I2C_SDA_DRIVEN_SIM_VALUE 0
#define I2C_SDA_EDGE_TYPE NONE
#define I2C_SDA_FREQ 50000000
#define I2C_SDA_HAS_IN 0
#define I2C_SDA_HAS_OUT 0
#define I2C_SDA_HAS_TRI 1
#define I2C_SDA_IRQ_TYPE NONE
#define I2C_SDA_RESET_VALUE 0

/*
 * Macros for device 'wr', class 'altera_avalon_pio'
 * The macros are prefixed with 'WR_'.
 * The prefix is the slave descriptor.
 */
#define WR_COMPONENT_TYPE altera_avalon_pio
#define WR_COMPONENT_NAME wr
#define WR_BASE 0xa0
#define WR_SPAN 32
#define WR_END 0xbf
#define WR_BIT_CLEARING_EDGE_REGISTER 0
#define WR_BIT_MODIFYING_OUTPUT_REGISTER 0
#define WR_CAPTURE 0
#define WR_DATA_WIDTH 1
#define WR_DO_TEST_BENCH_WIRING 0
#define WR_DRIVEN_SIM_VALUE 0
#define WR_EDGE_TYPE NONE
#define WR_FREQ 50000000
#define WR_HAS_IN 0
#define WR_HAS_OUT 1
#define WR_HAS_TRI 0
#define WR_IRQ_TYPE NONE
#define WR_RESET_VALUE 0

/*
 * Macros for device 'selector', class 'altera_avalon_pio'
 * The macros are prefixed with 'SELECTOR_'.
 * The prefix is the slave descriptor.
 */
#define SELECTOR_COMPONENT_TYPE altera_avalon_pio
#define SELECTOR_COMPONENT_NAME selector
#define SELECTOR_BASE 0xb0
#define SELECTOR_SPAN 32
#define SELECTOR_END 0xcf
#define SELECTOR_BIT_CLEARING_EDGE_REGISTER 0
#define SELECTOR_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SELECTOR_CAPTURE 0
#define SELECTOR_DATA_WIDTH 2
#define SELECTOR_DO_TEST_BENCH_WIRING 0
#define SELECTOR_DRIVEN_SIM_VALUE 0
#define SELECTOR_EDGE_TYPE NONE
#define SELECTOR_FREQ 50000000
#define SELECTOR_HAS_IN 0
#define SELECTOR_HAS_OUT 1
#define SELECTOR_HAS_TRI 0
#define SELECTOR_IRQ_TYPE NONE
#define SELECTOR_RESET_VALUE 0

/*
 * Macros for device 'result', class 'altera_avalon_pio'
 * The macros are prefixed with 'RESULT_'.
 * The prefix is the slave descriptor.
 */
#define RESULT_COMPONENT_TYPE altera_avalon_pio
#define RESULT_COMPONENT_NAME result
#define RESULT_BASE 0xc0
#define RESULT_SPAN 32
#define RESULT_END 0xdf
#define RESULT_BIT_CLEARING_EDGE_REGISTER 0
#define RESULT_BIT_MODIFYING_OUTPUT_REGISTER 0
#define RESULT_CAPTURE 0
#define RESULT_DATA_WIDTH 32
#define RESULT_DO_TEST_BENCH_WIRING 0
#define RESULT_DRIVEN_SIM_VALUE 0
#define RESULT_EDGE_TYPE NONE
#define RESULT_FREQ 50000000
#define RESULT_HAS_IN 1
#define RESULT_HAS_OUT 0
#define RESULT_HAS_TRI 0
#define RESULT_IRQ_TYPE NONE
#define RESULT_RESET_VALUE 0

/*
 * Macros for device 'val2', class 'altera_avalon_pio'
 * The macros are prefixed with 'VAL2_'.
 * The prefix is the slave descriptor.
 */
#define VAL2_COMPONENT_TYPE altera_avalon_pio
#define VAL2_COMPONENT_NAME val2
#define VAL2_BASE 0xd0
#define VAL2_SPAN 32
#define VAL2_END 0xef
#define VAL2_BIT_CLEARING_EDGE_REGISTER 0
#define VAL2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define VAL2_CAPTURE 0
#define VAL2_DATA_WIDTH 32
#define VAL2_DO_TEST_BENCH_WIRING 0
#define VAL2_DRIVEN_SIM_VALUE 0
#define VAL2_EDGE_TYPE NONE
#define VAL2_FREQ 50000000
#define VAL2_HAS_IN 0
#define VAL2_HAS_OUT 1
#define VAL2_HAS_TRI 0
#define VAL2_IRQ_TYPE NONE
#define VAL2_RESET_VALUE 0

/*
 * Macros for device 'val1', class 'altera_avalon_pio'
 * The macros are prefixed with 'VAL1_'.
 * The prefix is the slave descriptor.
 */
#define VAL1_COMPONENT_TYPE altera_avalon_pio
#define VAL1_COMPONENT_NAME val1
#define VAL1_BASE 0xe0
#define VAL1_SPAN 32
#define VAL1_END 0xff
#define VAL1_BIT_CLEARING_EDGE_REGISTER 0
#define VAL1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define VAL1_CAPTURE 0
#define VAL1_DATA_WIDTH 32
#define VAL1_DO_TEST_BENCH_WIRING 0
#define VAL1_DRIVEN_SIM_VALUE 0
#define VAL1_EDGE_TYPE NONE
#define VAL1_FREQ 50000000
#define VAL1_HAS_IN 0
#define VAL1_HAS_OUT 1
#define VAL1_HAS_TRI 0
#define VAL1_IRQ_TYPE NONE
#define VAL1_RESET_VALUE 0


#endif /* _ALTERA_HPS_0_H_ */