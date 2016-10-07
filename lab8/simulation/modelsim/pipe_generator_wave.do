onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /pipe_generator_testbench/clk
add wave -noupdate -label reset /pipe_generator_testbench/reset
add wave -noupdate -label active /pipe_generator_testbench/active
add wave -noupdate -label gameOver /pipe_generator_testbench/over
add wave -noupdate -label index /pipe_generator_testbench/j
add wave -noupdate -label leds /pipe_generator_testbench/leds
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1768 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 206
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
WaveRestoreZoom {0 ps} {4542 ps}
