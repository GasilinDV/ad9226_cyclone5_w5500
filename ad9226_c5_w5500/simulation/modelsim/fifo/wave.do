onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {clk and reset_n}
add wave -noupdate /fifo_tb/clk_tb
add wave -noupdate /fifo_tb/data_in_tb
add wave -noupdate /fifo_tb/write_enable_tb
add wave -noupdate /fifo_tb/read_enabled_tb

add wave -noupdate /fifo_tb/data_out_tb
add wave -noupdate /fifo_tb/fifo_empty_tb
add wave -noupdate /fifo_tb/fifo_full_tb
add wave -noupdate /fifo_tb/data_out_valid_tb

add wave -noupdate /fifo_tb/DUT/clk
add wave -noupdate /fifo_tb/DUT/data_in
add wave -noupdate /fifo_tb/DUT/data_out
add wave -noupdate /fifo_tb/DUT/write_enabled
add wave -noupdate /fifo_tb/DUT/read_enabled
add wave -noupdate /fifo_tb/DUT/fifo_empty
add wave -noupdate /fifo_tb/DUT/fifo_full

add wave -noupdate /fifo_tb/DUT/DATA_WIDTH
add wave -noupdate /fifo_tb/DUT/ADDRESS_WIDTH
add wave -noupdate /fifo_tb/DUT/MAX_ENTRIES
add wave -noupdate /fifo_tb/DUT/memory
add wave -noupdate /fifo_tb/DUT/write_pointer
add wave -noupdate /fifo_tb/DUT/read_pointer
add wave -noupdate /fifo_tb/DUT/fifo_counter

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
