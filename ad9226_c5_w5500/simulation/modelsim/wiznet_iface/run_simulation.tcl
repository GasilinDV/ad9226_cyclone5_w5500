# setup variables for simulation script
set TOP_LEVEL_NAME  wiznet_5500_tb 
# compile testbench and test program
# -L altera_common_sv_packages
transcript on
vlib work
vlog +incdir+ wiznet_5500_tb.sv
vlog +incdir+ wiznet5500.sv 

vsim -t 1ns -novopt work.wiznet_5500_tb
# load and run simulation
do wave.do
run 10us
wave zoom full

# alias to re-compile changes made to test program, load and run simulation
alias rerun {
    vlog +incdir+ wiznet_5500_tb.sv
    vsim -t 1ns -novopt work.wiznet_5500_tb
    do wave.do
    run 10us
    wave zoom full
}

