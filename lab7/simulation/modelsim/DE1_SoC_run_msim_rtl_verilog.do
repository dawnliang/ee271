transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+U:/ee271/lab7 {U:/ee271/lab7/DE1_SoC.sv}
vlog -sv -work work +incdir+U:/ee271/lab7 {U:/ee271/lab7/user_input.sv}
vlog -sv -work work +incdir+U:/ee271/lab7 {U:/ee271/lab7/normalLight.sv}
vlog -sv -work work +incdir+U:/ee271/lab7 {U:/ee271/lab7/victory.sv}
vlog -sv -work work +incdir+U:/ee271/lab7 {U:/ee271/lab7/lfsr.sv}
vlog -sv -work work +incdir+U:/ee271/lab7 {U:/ee271/lab7/adder.sv}
vlog -sv -work work +incdir+U:/ee271/lab7 {U:/ee271/lab7/lfsr9.sv}

