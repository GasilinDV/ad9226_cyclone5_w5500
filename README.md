In this project, the data is transferred from the generator to the AD9226 ADC, digitized, accepted by the FPGA Cyclone 5 (5CEFA2F23I7) and sent to the computer using the w5500 chip.
The project provides testbench, which can be run by going to the directory with the project and using the run_simulation.tcl script.
In this case, lines from 100 to 110 must be commented out in the w5500_fpga (top-level module).
Separate project modules are also tested. Test modules can be found in the simulation folder.
The project is taken as a basis: https://github.com/harout/concurrent-data-capture
