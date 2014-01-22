onerror {quit -f}
vlib work
vlog -work work ArithmaticUnit.vo
vlog -work work ArithmaticUnit.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.TwoDigitBCDSymbolOnly_vlg_vec_tst
vcd file -direction ArithmaticUnit.msim.vcd
vcd add -internal TwoDigitBCDSymbolOnly_vlg_vec_tst/*
vcd add -internal TwoDigitBCDSymbolOnly_vlg_vec_tst/i1/*
add wave /*
run -all
