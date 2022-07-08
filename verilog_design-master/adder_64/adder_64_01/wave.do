onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /adder_64_tb/clk
add wave -noupdate /adder_64_tb/rst_n
add wave -noupdate /adder_64_tb/a_in
add wave -noupdate /adder_64_tb/b_in
add wave -noupdate -color Gold -itemcolor Gold /adder_64_tb/carry_in
add wave -noupdate /adder_64_tb/sum_out
add wave -noupdate -color Red -itemcolor Red /adder_64_tb/carry_out
add wave -noupdate /adder_64_tb/u_adder_64/sum0
add wave -noupdate /adder_64_tb/u_adder_64/sum1
add wave -noupdate /adder_64_tb/u_adder_64/sum2
add wave -noupdate /adder_64_tb/u_adder_64/sum3
add wave -noupdate /adder_64_tb/u_adder_64/carry_out0
add wave -noupdate /adder_64_tb/u_adder_64/carry_out1
add wave -noupdate /adder_64_tb/u_adder_64/carry_out2
add wave -noupdate /adder_64_tb/u_adder_64/carry_out3
add wave -noupdate /adder_64_tb/u_adder_64/sum0_reg0
add wave -noupdate /adder_64_tb/u_adder_64/sum0_reg1
add wave -noupdate /adder_64_tb/u_adder_64/sum0_reg2
add wave -noupdate /adder_64_tb/u_adder_64/sum0_reg3
add wave -noupdate /adder_64_tb/u_adder_64/carry_out0_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {61000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 324
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
WaveRestoreZoom {9942 ps} {104740 ps}
