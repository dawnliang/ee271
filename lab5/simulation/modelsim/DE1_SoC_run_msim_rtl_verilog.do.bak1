transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+U:/ee271/lab5 {U:/ee271/lab5/simple.sv}
vlog -sv -work work +incdir+U:/ee271/lab5 {U:/ee271/lab5/winddir.sv}
vlog -sv -work work +incdir+U:/ee271/lab5 {U:/ee271/lab5/DE1_SoC.sv}
vlog -sv -work work +incdir+U:/ee271/lab5 {U:/ee271/lab5/DE1_SoC2.sv}

