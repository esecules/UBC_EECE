onerror {quit -f}
vlib work
vlog -work work HexTo7SegmentDisplayDriver.vo
vlog -work work HexTo7SegmentDisplayDriver.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.HexTo7SegmentDisplayDriver_vlg_vec_tst
vcd file -direction HexTo7SegmentDisplayDriver.msim.vcd
vcd add -internal HexTo7SegmentDisplayDriver_vlg_vec_tst/*
vcd add -internal HexTo7SegmentDisplayDriver_vlg_vec_tst/i1/*
add wave /*
run -all
