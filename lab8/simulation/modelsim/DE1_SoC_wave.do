onerror {resume}
quietly virtual signal -install /DE1_SoC_testbench { /DE1_SoC_testbench/GPIO_0[35:28]} g
quietly virtual signal -install /DE1_SoC_testbench { /DE1_SoC_testbench/GPIO_0[27:20]} r
quietly virtual signal -install /DE1_SoC_testbench { /DE1_SoC_testbench/GPIO_0[19:12]} s
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /DE1_SoC_testbench/clk
add wave -noupdate -label in {/DE1_SoC_testbench/KEY[0]}
add wave -noupdate -label reset {/DE1_SoC_testbench/SW[9]}
add wave -noupdate -label green_driver /DE1_SoC_testbench/g
add wave -noupdate -label red_driver /DE1_SoC_testbench/r
add wave -noupdate -label row_sinks /DE1_SoC_testbench/s
add wave -noupdate -label HEX0 /DE1_SoC_testbench/HEX0
add wave -noupdate -label HEX1 /DE1_SoC_testbench/HEX1
add wave -noupdate -label HEX2 /DE1_SoC_testbench/HEX2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 215
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
WaveRestoreZoom {0 ps} {5250 ps}
