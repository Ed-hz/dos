rm -r work
vlib work
vlog ../src/*.v 
vsim traffic_light_tb -novopt
