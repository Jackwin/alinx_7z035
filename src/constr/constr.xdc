
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]

set_property IOSTANDARD LVCMOS33 [get_ports {led_tri_o[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_tri_o[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_tri_o[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_tri_o[3]}]
set_property PACKAGE_PIN AB15 [get_ports {led_tri_o[0]}]
set_property PACKAGE_PIN AB14 [get_ports {led_tri_o[1]}]
set_property PACKAGE_PIN AF13 [get_ports {led_tri_o[2]}]
set_property PACKAGE_PIN AE13 [get_ports {led_tri_o[3]}]

set_property PACKAGE_PIN C8 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]

create_clock -period 5.000 -name sys_clk_p -waveform {0.000 2.500} [get_ports sys_clk_p]

#fan
set_property IOSTANDARD LVCMOS33 [get_ports fan_pwm]
set_property PACKAGE_PIN Y15 [get_ports fan_pwm]