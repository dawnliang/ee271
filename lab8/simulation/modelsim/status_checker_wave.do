onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /status_checker_testbench/clk
add wave -noupdate -label reset /status_checker_testbench/reset
add wave -noupdate -label active /status_checker_testbench/active
add wave -noupdate -label cc /status_checker_testbench/player
add wave -noupdate -label pipes /status_checker_testbench/pipes
add wave -noupdate -label crash /status_checker_testbench/crash
add wave -noupdate -label addPoint /status_checker_testbench/addPoint
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 103
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
WaveRestoreZoom {0 ps} {1050 ps}
