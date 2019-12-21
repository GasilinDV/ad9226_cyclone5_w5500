# setup variables for simulation script
set TOP_LEVEL_NAME   fifo_tb.sv

# compile testbench and test program
# -L altera_common_sv_packages
transcript on
vlib work
vlog +incdir+ fifo_tb.sv
vlog +incdir+ fifo.sv 

vsim -t 1ns -novopt work.fifo_tb
# load and run simulation
do wave.do
run 5us
wave zoom full

# alias to re-compile changes made to test program, load and run simulation
alias rerun {
    vlog +incdir+ fifo_tb.sv
    vsim -t 1ns -novopt work.fifo_tb
    do wave.do
    run 5us
    wave zoom full
}

