$module_name = "full_adder_tb"
vlib work
vlog ../src/*.v -l comp.log
vsim -c ("work." + $module_name) -novopt -l sim.log
rm -r work

