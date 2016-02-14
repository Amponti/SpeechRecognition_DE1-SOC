set_global_assignment -entity "clk_18_4" -library "lib_clk_18_4" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "clk_18_4" -library "lib_clk_18_4" -name IP_TOOL_VERSION "14.1"
set_global_assignment -entity "clk_18_4" -library "lib_clk_18_4" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_clk_18_4" -name SPD_FILE [file join $::quartus(sip_path) "clk_18_4.spd"]

set_global_assignment -library "lib_clk_18_4" -name MISC_FILE [file join $::quartus(sip_path) "clk_18_4_sim/clk_18_4.vo"]
