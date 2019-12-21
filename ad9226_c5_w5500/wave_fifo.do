onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {clk and reset_n}
add wave -noupdate /wiznet5500_tb/clk_in_tb
add wave -noupdate /wiznet5500_tb/eth_spi_sck_tb

add wave -noupdate /wiznet5500_tb/data_a_in_tb
add wave -noupdate /wiznet5500_tb/aclk_tb
add wave -noupdate /wiznet5500_tb/data_a_out_tb


add wave -noupdate /wiznet5500_tb/DUT/clk
add wave -noupdate /wiznet5500_tb/DUT/data_a_in
add wave -noupdate /wiznet5500_tb/DUT/aclk

add wave -noupdate /wiznet5500_tb/DUT/data_adc9226

add wave -noupdate /wiznet5500_tb/DUT/data_to_fifo
add wave -noupdate /wiznet5500_tb/DUT/fifo_read_enabled
add wave -noupdate /wiznet5500_tb/DUT/fifo_data_out
add wave -noupdate /wiznet5500_tb/DUT/fifo_write_enabled
add wave -noupdate /wiznet5500_tb/DUT/fifo_empty
add wave -noupdate /wiznet5500_tb/DUT/fifo_full
add wave -noupdate /wiznet5500_tb/DUT/fifo_data_out_valid

add wave -noupdate /wiznet5500_tb/DUT/buffer
add wave -noupdate /wiznet5500_tb/DUT/buffer_valid
add wave -noupdate /wiznet5500_tb/DUT/counter
add wave -noupdate /wiznet5500_tb/DUT/flush_requested
add wave -noupdate /wiznet5500_tb/DUT/data_to_ethernet
add wave -noupdate /wiznet5500_tb/DUT/data_out_valid
add wave -noupdate /wiznet5500_tb/DUT/instruction_input
add wave -noupdate /wiznet5500_tb/DUT/instruction_input_valid
add wave -noupdate /wiznet5500_tb/DUT/ethernet_available
add wave -noupdate /wiznet5500_tb/DUT/has_pushed_samples
add wave -noupdate /wiznet5500_tb/DUT/sample_values

add wave -noupdate /wiznet5500_tb/DUT/fifo/clk
add wave -noupdate /wiznet5500_tb/DUT/fifo/data_in
add wave -noupdate /wiznet5500_tb/DUT/fifo/data_out
add wave -noupdate /wiznet5500_tb/DUT/fifo/write_enable
add wave -noupdate /wiznet5500_tb/DUT/fifo/read_enable
add wave -noupdate /wiznet5500_tb/DUT/fifo/fifo_empty
add wave -noupdate /wiznet5500_tb/DUT/fifo/fifo_full
add wave -noupdate /wiznet5500_tb/DUT/fifo/data_out_valid
add wave -noupdate /wiznet5500_tb/DUT/fifo/fifo_counter
add wave -noupdate /wiznet5500_tb/DUT/fifo/memory
add wave -noupdate /wiznet5500_tb/DUT/fifo/write_pointer
add wave -noupdate /wiznet5500_tb/DUT/fifo/read_pointer

add wave -noupdate /wiznet5500_tb/DUT/ad9226/data_send
add wave -noupdate /wiznet5500_tb/DUT/ad9226/sample_counter
add wave -noupdate /wiznet5500_tb/DUT/ad9226/fifo_counter
add wave -noupdate /wiznet5500_tb/DUT/ad9226/read_ready
add wave -noupdate /wiznet5500_tb/DUT/ad9226/data_out_counter

add wave -noupdate /wiznet5500_tb/DUT/eth_iface/clk
add wave -noupdate /wiznet5500_tb/DUT/eth_iface/is_available
add wave -noupdate /wiznet5500_tb/DUT/eth_iface/data_input
add wave -noupdate /wiznet5500_tb/DUT/eth_iface/data_input_valid
add wave -noupdate /wiznet5500_tb/DUT/eth_iface/flush_requested
add wave -noupdate /wiznet5500_tb/DUT/eth_iface/is_busy
add wave -noupdate /wiznet5500_tb/DUT/eth_iface/mosi
add wave -noupdate /wiznet5500_tb/DUT/eth_iface/miso
add wave -noupdate /wiznet5500_tb/DUT/eth_iface/spi_clk




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
