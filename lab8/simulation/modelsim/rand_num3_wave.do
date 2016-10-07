onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /rand_num3_testbench/clk
add wave -noupdate -label reset /rand_num3_testbench/reset
add wave -noupdate -label active /rand_num3_testbench/active
add wave -noupdate -label out -radix unsigned /rand_num3_testbench/r
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1260 ps}
