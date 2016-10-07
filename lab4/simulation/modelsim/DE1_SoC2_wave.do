onerror {resume}
quietly virtual function -install /DE1_SoC2_testbench -env /DE1_SoC2_testbench { &{/DE1_SoC2_testbench/SW[3], /DE1_SoC2_testbench/SW[2], /DE1_SoC2_testbench/SW[1], /DE1_SoC2_testbench/SW[0] }} SWs
quietly WaveActivateNextPane {} 0
add wave -noupdate /DE1_SoC2_testbench/HEX0
add wave -noupdate /DE1_SoC2_testbench/HEX1
add wave -noupdate /DE1_SoC2_testbench/HEX2
add wave -noupdate /DE1_SoC2_testbench/HEX3
add wave -noupdate /DE1_SoC2_testbench/HEX4
add wave -noupdate /DE1_SoC2_testbench/HEX5
add wave -noupdate {/DE1_SoC2_testbench/LEDR[1]}
add wave -noupdate {/DE1_SoC2_testbench/LEDR[0]}
add wave -noupdate /DE1_SoC2_testbench/SWs
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {168 ps}
