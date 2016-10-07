onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /pipe_shifter_testbench/clk
add wave -noupdate -label reset /pipe_shifter_testbench/reset
add wave -noupdate -label active /pipe_shifter_testbench/active
add wave -noupdate -label over /pipe_shifter_testbench/over
add wave -noupdate -label nr /pipe_shifter_testbench/nr
add wave -noupdate -label out /pipe_shifter_testbench/pipes
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {473 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 209
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
WaveRestoreZoom {0 ps} {937 ps}
