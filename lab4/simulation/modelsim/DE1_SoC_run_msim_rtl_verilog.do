transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+U:/ee271/lab4 {U:/ee271/lab4/upc_check.sv}
vlog -sv -work work +incdir+U:/ee271/lab4 {U:/ee271/lab4/upc_display.sv}
vlog -sv -work work +incdir+U:/ee271/lab4 {U:/ee271/lab4/DE1_SoC2.sv}

