onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label upc /upc_display_testbench/dut/upc
add wave -noupdate -label hex5 /upc_display_testbench/dut/hex5
add wave -noupdate -label hex4 /upc_display_testbench/dut/hex4
add wave -noupdate -label hex3 /upc_display_testbench/dut/hex3
add wave -noupdate -label hex2 /upc_display_testbench/dut/hex2
add wave -noupdate -label hex1 /upc_display_testbench/dut/hex1
add wave -noupdate -label hex0 /upc_display_testbench/dut/hex0
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
WaveRestoreZoom {0 ps} {1 ns}
