onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label M /upc_check_testbench/dut/M
add wave -noupdate -label U /upc_check_testbench/dut/U
add wave -noupdate -label P /upc_check_testbench/dut/P
add wave -noupdate -label C /upc_check_testbench/dut/C
add wave -noupdate -label D /upc_check_testbench/dut/D
add wave -noupdate -label E /upc_check_testbench/dut/E
add wave -noupdate -label S /upc_check_testbench/dut/S
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
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
WaveRestoreZoom {0 ps} {252 ps}
