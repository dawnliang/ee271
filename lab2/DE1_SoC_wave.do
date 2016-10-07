onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label LEDR0 {/DE1_SoC_testbench/LEDR[0]}
add wave -noupdate -label {LAST DIG} /DE1_SoC_testbench/dut/ldresult
add wave -noupdate -label {NEXT DIG} /DE1_SoC_testbench/dut/ndresult
add wave -noupdate -label SW7 {/DE1_SoC_testbench/SW[7]}
add wave -noupdate -label SW6 {/DE1_SoC_testbench/SW[6]}
add wave -noupdate -label SW5 {/DE1_SoC_testbench/SW[5]}
add wave -noupdate -label SW4 {/DE1_SoC_testbench/SW[4]}
add wave -noupdate -label SW3 {/DE1_SoC_testbench/SW[3]}
add wave -noupdate -label SW2 {/DE1_SoC_testbench/SW[2]}
add wave -noupdate -label SW1 {/DE1_SoC_testbench/SW[1]}
add wave -noupdate -label SW0 {/DE1_SoC_testbench/SW[0]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {30 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 93
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
WaveRestoreZoom {0 ps} {2248 ps}
