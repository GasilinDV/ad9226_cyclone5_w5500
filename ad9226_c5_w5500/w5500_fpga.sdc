## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Standard Edition"

## DATE    "Mon Sep 16 15:24:04 2019"

##
## DEVICE  "5CEFA2F23I7"
##

#**************************************************************
# Time Information
#**************************************************************
set_time_format -unit ns -decimal_places 3

#**************************************************************
# Create Clock
#**************************************************************
create_clock -name {clk} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk}]
create_generated_clock -name {eth_spi_sck} -divide_by 2 -source [get_ports {clk}]

#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty

#**************************************************************
# Set Input Delay
#**************************************************************
set_input_delay -clock clk -max 7.0 [get_ports data_a_in[*]]
set_input_delay -clock clk -min 3.5 [get_ports data_a_in[*]]

set_input_delay -clock eth_spi_sck -max 3.0 [get_ports eth_spi_miso]
set_input_delay -clock eth_spi_sck -min -3.0 [get_ports eth_spi_miso]

set_input_delay -clock eth_spi_sck -max 0.28 [get_ports key_1]
set_input_delay -clock eth_spi_sck -min 0.28 [get_ports key_1]

#**************************************************************
# Set Output Delay
#**************************************************************
set_output_delay -clock eth_spi_sck -max  3.0 [get_ports eth_spi_mosi]
set_output_delay -clock eth_spi_sck -min -3.0 [get_ports eth_spi_mosi]

set_output_delay -clock eth_spi_sck -max  5.0 [get_ports eth_spi_sck]
set_output_delay -clock eth_spi_sck -min -5.0 [get_ports eth_spi_sck]

set_output_delay -clock eth_spi_sck -max  5.0 [get_ports eth_spi_ss_n]
set_output_delay -clock eth_spi_sck -min -5.0 [get_ports eth_spi_ss_n]

#**************************************************************
# Set Clock Groups
#**************************************************************
set_clock_groups -exclusive -group {clk}

#**************************************************************
# Set False Path
#**************************************************************
set_false_path -from [get_clocks {clk}] -to [get_ports {led}]
set_false_path -from [get_clocks {clk}] -to [get_ports {eth_rst}]
set_false_path -from [get_clocks {clk}] -to [get_ports {aclk}]

#**************************************************************
# Set Multicycle Path
#**************************************************************

#**************************************************************
# Set Maximum Delay
#**************************************************************

#**************************************************************
# Set Minimum Delay
#**************************************************************

#**************************************************************
# Set Input Transition
#**************************************************************

