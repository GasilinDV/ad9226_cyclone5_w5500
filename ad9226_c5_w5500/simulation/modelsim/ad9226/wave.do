onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {clk and reset_n}
add wave -noupdate /adc_tb/clk_tb
add wave -noupdate /adc_tb/reset_n_tb
add wave -noupdate /adc_tb/data_in_tb

add wave -noupdate /adc_tb/fifo_write_enable_tb
add wave -noupdate /adc_tb/data_out_tb

add wave -noupdate /adc_tb/DUT/sys_clk
add wave -noupdate /adc_tb/DUT/reset_n
add wave -noupdate /adc_tb/DUT/fifo_full
add wave -noupdate /adc_tb/DUT/data_in
       
add wave -noupdate /adc_tb/DUT/fifo_write_enable
add wave -noupdate /adc_tb/DUT/data_out

add wave -noupdate /adc_tb/DUT/data_send
add wave -noupdate /adc_tb/DUT/sample_counter

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
