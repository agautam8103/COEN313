read_vhdl  { ../lab4.vhd }
read_xdc lab4_script.xdc


synth_design -top registers_min_max -part xc7a100tcsg324-1



opt_design
place_design
route_design
report_timing_summary

set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]
write_bitstream -force lab4.bit
