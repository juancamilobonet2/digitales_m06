do BB_SYSTEM_run_msim_rtl_verilog.do
onerror {resume}
quietly WaveActivateNextPane {} 0
delete wave *
add wave -noupdate /TB_SYSTEM/eachvec

add wave  -divider LedMATRIX
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_CLOCK_50
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_RESET_InHigh
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_startButton_InLow
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_leftButton_jug1_InLow
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_rightButton_jug1_InLow
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_leftButton_jug2_InLow
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_rightButton_jug2_InLow


add wave -divider JUGADORES

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_REGJUG_u0/SC_REGJUG_data_OutBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_REGJUG_u1/SC_REGJUG_data_OutBUS

#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_TEST0
#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_TEST1
#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_TEST2
#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_TEST3
#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_TEST4
#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_TEST5
#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_TEST6
#add wave -noupdate /TB_SYSTEM/TB_SYSTEM_TEST7

add wave -noupdate /TB_SYSTEM/TB_SYSTEM_max7219DIN_Out
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_max7219NCS_Out
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_max7219CLK_Out

#add wave  -divider SC_DEBOUNCE1_u0
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u0/SC_DEBOUNCE1_button_In
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u0/SC_DEBOUNCE1_button_Out
#
#add wave  -divider SC_DEBOUNCE1_u1
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u1/SC_DEBOUNCE1_button_In
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u1/SC_DEBOUNCE1_button_Out
#
#add wave  -divider SC_DEBOUNCE1_u2
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u2/SC_DEBOUNCE1_button_In
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_DEBOUNCE1_u2/SC_DEBOUNCE1_button_Out
#
#add wave  -divider TEST
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/matrix_ctrl_unit_0/clk_driverS
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/matrix_ctrl_unit_0/Trig_SignalNEG
#add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/matrix_ctrl_unit_0/Trig_SignalPOS

add wave  -divider MATRIX

add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_Reg_MATRIX_u7/SC_Reg_MATRIX_data_OutBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_Reg_MATRIX_u6/SC_Reg_MATRIX_data_OutBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_Reg_MATRIX_u5/SC_Reg_MATRIX_data_OutBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_Reg_MATRIX_u4/SC_Reg_MATRIX_data_OutBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_Reg_MATRIX_u3/SC_Reg_MATRIX_data_OutBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_Reg_MATRIX_u2/SC_Reg_MATRIX_data_OutBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/SC_Reg_MATRIX_u1/SC_Reg_MATRIX_data_OutBUS
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/CC_MUX21_u1/CC_MUX_21_z_Out



restart
run 500ms

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {319999492 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 445
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
WaveRestoreZoom {59829352 ps} {60892417 ps}
