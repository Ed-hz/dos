onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /traffic_light_tb/clk_125M
add wave -noupdate /traffic_light_tb/rst
add wave -noupdate -color Red /traffic_light_tb/c
add wave -noupdate /traffic_light_tb/HL
add wave -noupdate /traffic_light_tb/FL
add wave -noupdate -color Red /traffic_light_tb/u_traffic_light/clk
add wave -noupdate -color Yellow /traffic_light_tb/u_traffic_light/sc
add wave -noupdate /traffic_light_tb/u_traffic_light/fb
add wave -noupdate -color Gold /traffic_light_tb/u_traffic_light/u_FSM/state
add wave -noupdate /traffic_light_tb/u_traffic_light/u_FSM/state_next
add wave -noupdate -radix unsigned /traffic_light_tb/u_traffic_light/u_timer/t
add wave -noupdate /traffic_light_tb/u_traffic_light/tl
add wave -noupdate /traffic_light_tb/u_traffic_light/ts
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6670854316 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 302
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
configure wave -timelineunits ns
update
WaveRestoreZoom {6265064695 ps} {7055726947 ps}
