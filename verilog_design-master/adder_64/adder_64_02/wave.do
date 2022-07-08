onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Yellow /adder_64_tb/clk
add wave -noupdate /adder_64_tb/rst_n
add wave -noupdate /adder_64_tb/a_in
add wave -noupdate /adder_64_tb/b_in
add wave -noupdate -color Gold /adder_64_tb/carry_in
add wave -noupdate -color Gold /adder_64_tb/din_en
add wave -noupdate -color Red -itemcolor Red /adder_64_tb/sum_out
add wave -noupdate -color Red /adder_64_tb/carry_out
add wave -noupdate -color Red /adder_64_tb/dout_en
add wave -noupdate /adder_64_tb/u_adder_64/count
add wave -noupdate /adder_64_tb/u_adder_64/a
add wave -noupdate /adder_64_tb/u_adder_64/b
add wave -noupdate /adder_64_tb/u_adder_64/ci
add wave -noupdate /adder_64_tb/u_adder_64/sum
add wave -noupdate /adder_64_tb/u_adder_64/co
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4485 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 309
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {9237 ps}
