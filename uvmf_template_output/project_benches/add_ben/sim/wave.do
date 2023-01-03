 

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider add_input 
add wave -noupdate /uvm_root/uvm_test_top/environment/add_input/add_input_monitor/txn_stream
add wave -noupdate -group add_input_bus /hdl_top/add_input_bus/*
add wave -noupdate -divider add_output 
add wave -noupdate /uvm_root/uvm_test_top/environment/add_output/add_output_monitor/txn_stream
add wave -noupdate -group add_output_bus /hdl_top/add_output_bus/*

TreeUpdate [SetDefaultTree]
quietly wave cursor active 0
configure wave -namecolwidth 472
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
WaveRestoreZoom {27 ns} {168 ns}

