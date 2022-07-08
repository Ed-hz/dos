onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/clk_d
add wave -noupdate /tb/rst_d_n
add wave -noupdate /tb/init_d_n
add wave -noupdate /tb/event_d_sync
add wave -noupdate /tb/event_d
add wave -noupdate /tb/u_aaa/event_d_tmp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5196 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {8 ns}
