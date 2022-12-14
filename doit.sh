#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f cpu.vcd

# run Verilator to translate Veriolog into C++, including C++ testbench
verilator -Wall --cc --trace cpu.sv --exe lab4_cpu_tb.cpp

# build C++ project via make automatically generated by Verilator
make -j -C obj_dir/ -f Vcpu.mk Vcpu

# run executable simulation file
obj_dir/Vcpu