$module_name = "half_adder"
vlib work
vlog ../src/*.v -l comp.log
vsim ("work." + $module_name + "_tb") -c -novopt -l sim.log
rm -r work