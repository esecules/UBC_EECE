onerror {quit -f}
vlib work
vlog -work work VCR.vo
vlog -work work VCR.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.VCR_controller_vlg_vec_tst
vcd file -direction VCR.msim.vcd
vcd add -internal VCR_controller_vlg_vec_tst/*
vcd add -internal VCR_controller_vlg_vec_tst/i1/*
add wave /*
run -all
