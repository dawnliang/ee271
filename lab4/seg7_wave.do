onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal -childformat {{{/seg7_testbench/SW[9]} -radix decimal} {{/seg7_testbench/SW[8]} -radix decimal} {{/seg7_testbench/SW[7]} -radix decimal} {{/seg7_testbench/SW[6]} -radix decimal} {{/seg7_testbench/SW[5]} -radix decimal} {{/seg7_testbench/SW[4]} -radix decimal} {{/seg7_testbench/SW[3]} -radix decimal} {{/seg7_testbench/SW[2]} -radix decimal} {{/seg7_testbench/SW[1]} -radix decimal} {{/seg7_testbench/SW[0]} -radix decimal}} -subitemconfig {{/seg7_testbench/SW[9]} {-radix decimal} {/seg7_testbench/SW[8]} {-radix decimal} {/seg7_testbench/SW[7]} {-radix decimal} {/seg7_testbench/SW[6]} {-radix decimal} {/seg7_testbench/SW[5]} {-radix decimal} {/seg7_testbench/SW[4]} {-radix decimal} {/seg7_testbench/SW[3]} {-radix decimal} {/seg7_testbench/SW[2]} {-radix decimal} {/seg7_testbench/SW[1]} {-radix decimal} {/seg7_testbench/SW[0]} {-radix decimal}} /seg7_testbench/SW
add wave -noupdate /seg7_testbench/HEX0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {33 ps} 0}
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
WaveRestoreZoom {0 ps} {70 ps}
