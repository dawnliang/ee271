onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /winddir_testbench/clk
add wave -noupdate -label reset /winddir_testbench/reset
add wave -noupdate -label dir /winddir_testbench/dir
add wave -noupdate -label ps /winddir_testbench/dut/ps
add wave -noupdate -label ns /winddir_testbench/dut/ns
add wave -noupdate -label pattern /winddir_testbench/pattern
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {969 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1680 ps}
