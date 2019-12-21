onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {clk and reset_n}
add wave -noupdate /wiznet_5500_tb/clk_tb
add wave -noupdate /wiznet_5500_tb/miso_tb
add wave -noupdate /wiznet_5500_tb/instruction_input_valid_tb
add wave -noupdate /wiznet_5500_tb/instruction_input_tb
add wave -noupdate /wiznet_5500_tb/data_input_valid_tb
add wave -noupdate /wiznet_5500_tb/data_input_tb

add wave -noupdate /wiznet_5500_tb/flush_requested_tb
add wave -noupdate /wiznet_5500_tb/mosi_tb
add wave -noupdate /wiznet_5500_tb/spi_clk_tb
add wave -noupdate /wiznet_5500_tb/spi_chip_select_n_tb
add wave -noupdate /wiznet_5500_tb/data_read_tb
add wave -noupdate /wiznet_5500_tb/data_read_valid_tb
add wave -noupdate /wiznet_5500_tb/is_available_tb

add wave -noupdate /wiznet_5500_tb/DUT/clk
add wave -noupdate /wiznet_5500_tb/DUT/miso
add wave -noupdate /wiznet_5500_tb/DUT/instruction_input_valid
add wave -noupdate /wiznet_5500_tb/DUT/data_input
add wave -noupdate /wiznet_5500_tb/DUT/mosi
add wave -noupdate /wiznet_5500_tb/DUT/spi_clk;
add wave -noupdate /wiznet_5500_tb/DUT/spi_chip_select_n;

add wave -noupdate /wiznet_5500_tb/DUT/data_read
add wave -noupdate /wiznet_5500_tb/DUT/data_read_valid
add wave -noupdate /wiznet_5500_tb/DUT/is_available
add wave -noupdate /wiznet_5500_tb/DUT/current_instruction
add wave -noupdate /wiznet_5500_tb/DUT/spi_clock_count
add wave -noupdate /wiznet_5500_tb/DUT/state
add wave -noupdate /wiznet_5500_tb/DUT/next_state
add wave -noupdate /wiznet_5500_tb/DUT/initialization_progress
add wave -noupdate /wiznet_5500_tb/DUT/waiting_for_socket
add wave -noupdate /wiznet_5500_tb/DUT/is_initialized
add wave -noupdate /wiznet_5500_tb/DUT/read_free_space_progress
add wave -noupdate /wiznet_5500_tb/DUT/send_data_instruction
add wave -noupdate /wiznet_5500_tb/DUT/tx_buffer_write_pointer

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {14950 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 300
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 2
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {39689 ps}
