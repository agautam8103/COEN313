read_vhdl  { ../circuit.vhd}
read_xdc lab3_script.xdc

synth_design -top converter -part xc7a100tcsg324-1

opt_design
place_design
route_design

report_timing_summary

write_bitstream -force converter.bit
