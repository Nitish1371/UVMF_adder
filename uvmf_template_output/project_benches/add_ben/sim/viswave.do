 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { add_input }
wave add uvm_test_top.environment.add_input.add_input_monitor.txn_stream -radix string -tag F0
wave group add_input_bus
wave add -group add_input_bus hdl_top.add_input_bus.* -radix hexadecimal -tag F0
wave group add_input_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { add_output }
wave add uvm_test_top.environment.add_output.add_output_monitor.txn_stream -radix string -tag F0
wave group add_output_bus
wave add -group add_output_bus hdl_top.add_output_bus.* -radix hexadecimal -tag F0
wave group add_output_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

