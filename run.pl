#!/usr/bin/perl -w
use strict;
use warnings;

# compile the ISS first
chdir 'testbench/iss';
print ("make\n");
if (system ("make")) {
    print "Make failed..! Exiting!\n";
    exit;
}
else {
    # Copy the sim.so file to the main directory
    print ("cp sim.so ../../\n");
    system ("cp sim.so ../../");
    # Compile the RTL
    chdir "../../";
    print ("rm -rf vsim.wlf wlf* transcript work/\n");
    system ("rm -rf vsim.wlf wlf* transcript work/");
    print ("vlib work\n");
    system ("vlib work");
    print ("vlog testbench/* verilog/*\n");
    system ("vlog testbench/* verilog/*");
    # Run the simulation
    print ("vsim -c top_tb -sv_lib sim -do \"onElabError resume;  run -all; exit\" | tee sim.log");
    system ("vsim -c top_tb -sv_lib sim -do \"onElabError resume;  run -all; exit\" | tee sim.log");
}
