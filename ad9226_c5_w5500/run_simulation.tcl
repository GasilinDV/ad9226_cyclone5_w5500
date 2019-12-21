# setup variables for simulation script
set TOP_LEVEL_NAME   wiznet5500_tb.sv

# compile testbench and test program
# -L altera_common_sv_packages
transcript on
vlib work
vlog +incdir+ adc_data_sync.sv
vlog +incdir+ ad9226_data.sv
vlog +incdir+ w5500_fpga.sv
vlog +incdir+ fifo.sv 
vlog +incdir+ wiznet5500.sv
vlog +incdir+ wiznet5500_tb.sv

vsim -t 1ns -novopt work.wiznet5500_tb
# load and run simulation
do wave_samples.do
run 50000us
wave zoom full

# alias to re-compile changes made to test program, load and run simulation
alias rerun {
    vlog +incdir+ wiznet5500_tb.sv
    vsim -t 1ns -novopt work.wiznet5500_tb
    do wave.do
    run 100us
    wave zoom full
}

