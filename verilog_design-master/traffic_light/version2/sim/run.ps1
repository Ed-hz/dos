rm -r work
vlib work
vlog ../src/*.v -cover c -cover b -cover x -cover f
vsim traffic_light_tb -novopt -coverage
