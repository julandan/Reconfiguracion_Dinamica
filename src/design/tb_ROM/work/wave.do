onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /tb_roms_generador_control/i_control_icap/dout_e
add wave -noupdate /tb_roms_generador_control/i_control_icap/enable_led
add wave -noupdate /tb_roms_generador_control/i_control_icap/i_control/current_state
add wave -noupdate -radix hexadecimal /tb_roms_generador_control/i_control_icap/I
add wave -noupdate /tb_roms_generador_control/i_control_icap/clk
add wave -noupdate -radix unsigned /tb_roms_generador_control/i_control_icap/dir
add wave -noupdate -radix hexadecimal /tb_roms_generador_control/i_control_icap/sal
add wave -noupdate -radix hexadecimal /tb_roms_generador_control/i_control_icap/dout_e
add wave -noupdate /tb_roms_generador_control/i_control_icap/enable_led
add wave -noupdate /tb_roms_generador_control/i_control_icap/i_control/current_state
add wave -noupdate -radix hexadecimal /tb_roms_generador_control/i_control_icap/I
add wave -noupdate /tb_roms_generador_control/i_control_icap/clk
add wave -noupdate -radix unsigned /tb_roms_generador_control/i_control_icap/dir
add wave -noupdate -radix hexadecimal /tb_roms_generador_control/i_control_icap/sal
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {225827 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {225445 ns} {225945 ns}
