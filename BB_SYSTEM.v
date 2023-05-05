/*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module BB_SYSTEM (
//////////// OUTPUTS //////////
	BB_SYSTEM_display_OutBUS,
	BB_SYSTEM_max7219DIN_Out,
	BB_SYSTEM_max7219NCS_Out,
	BB_SYSTEM_max7219CLK_Out,
	BB_SYSTEM_startButton_Out, 
	BB_SYSTEM_leftButton_jug1_Out,
	BB_SYSTEM_leftButton_jug2_Out,
	BB_SYSTEM_rightButton_jug1_Out,
	BB_SYSTEM_rightButton_jug2_Out,

	BB_SYSTEM_TEST0,
	BB_SYSTEM_TEST1,
	BB_SYSTEM_TEST2,
	BB_SYSTEM_TEST3,
	BB_SYSTEM_TEST4,
	BB_SYSTEM_TEST5,
	BB_SYSTEM_TEST6,
	BB_SYSTEM_TEST7,

//////////// INPUTS //////////
	BB_SYSTEM_CLOCK_50,
	BB_SYSTEM_RESET_InHigh,
	BB_SYSTEM_startButton_InLow, 
	BB_SYSTEM_leftButton_jug1_InLow,
	BB_SYSTEM_rightButton_jug1_InLow,
	BB_SYSTEM_leftButton_jug2_InLow,
	BB_SYSTEM_rightButton_jug2_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================
 parameter DATAWIDTH_BUS = 8;
 parameter PRESCALER_DATAWIDTH = 23;
 parameter DISPLAY_DATAWIDTH = 12;
 
 //Pantalla Esperando
 parameter DATA_FIXED_ESPReg_JUG_7 = 8'b00000000;
 
 
 // Pantalla Start
 parameter DATA_FIXED_INITReg_JUG_7 = 8'b00000000;
 parameter DATA_FIXED_INITReg_JUG_6 = 8'b01100110;
 parameter DATA_FIXED_INITReg_JUG_5 = 8'b01000100;
 parameter DATA_FIXED_INITReg_JUG_4 = 8'b01000100;
 parameter DATA_FIXED_INITReg_JUG_3 = 8'b00100010;
 parameter DATA_FIXED_INITReg_JUG_2 = 8'b00100010;
 parameter DATA_FIXED_INITReg_JUG_1 = 8'b01100110;
 parameter DATA_FIXED_INITReg_JUG_0 = 8'b00000000;
// Pantalla Go
 parameter DATA_FIXED_GO_Reg_JUG_7 = 8'b00000000;
 parameter DATA_FIXED_GO_Reg_JUG_6 = 8'b01100110;
 parameter DATA_FIXED_GO_Reg_JUG_5 = 8'b10001001;
 parameter DATA_FIXED_GO_Reg_JUG_4 = 8'b10001001;
 parameter DATA_FIXED_GO_Reg_JUG_3 = 8'b10111001;
 parameter DATA_FIXED_GO_Reg_JUG_2 = 8'b10011001;
 parameter DATA_FIXED_GO_Reg_JUG_1 = 8'b01100110;
 parameter DATA_FIXED_GO_Reg_JUG_0 = 8'b00000000;
// Pantalla Nivel 1
 parameter DATA_FIXED_L1_Reg_JUG_7 = 8'b00000000;
 parameter DATA_FIXED_L1_Reg_JUG_6 = 8'b00001000;
 parameter DATA_FIXED_L1_Reg_JUG_5 = 8'b00011000;
 parameter DATA_FIXED_L1_Reg_JUG_4 = 8'b00001000;
 parameter DATA_FIXED_L1_Reg_JUG_3 = 8'b00001000;
 parameter DATA_FIXED_L1_Reg_JUG_2 = 8'b00001000;
 parameter DATA_FIXED_L1_Reg_JUG_1 = 8'b00011100;
 parameter DATA_FIXED_L1_Reg_JUG_0 = 8'b00000000;
// Pantalla Nivel 2
 parameter DATA_FIXED_L2_Reg_JUG_7 = 8'b00000000;
 parameter DATA_FIXED_L2_Reg_JUG_6 = 8'b00011000;
 parameter DATA_FIXED_L2_Reg_JUG_5 = 8'b00100100;
 parameter DATA_FIXED_L2_Reg_JUG_4 = 8'b00000100;
 parameter DATA_FIXED_L2_Reg_JUG_3 = 8'b00001000;
 parameter DATA_FIXED_L2_Reg_JUG_2 = 8'b00010000;
 parameter DATA_FIXED_L2_Reg_JUG_1 = 8'b00111100;
 parameter DATA_FIXED_L2_Reg_JUG_0 = 8'b00000000;
// Pantalla Nivel 3
 parameter DATA_FIXED_L3_Reg_JUG_7 = 8'b00000000;
 parameter DATA_FIXED_L3_Reg_JUG_6 = 8'b00011000;
 parameter DATA_FIXED_L3_Reg_JUG_5 = 8'b00100100;
 parameter DATA_FIXED_L3_Reg_JUG_4 = 8'b00000100;
 parameter DATA_FIXED_L3_Reg_JUG_3 = 8'b00001000;
 parameter DATA_FIXED_L3_Reg_JUG_2 = 8'b00000100;
 parameter DATA_FIXED_L3_Reg_JUG_1 = 8'b00100100;
 parameter DATA_FIXED_L3_Reg_JUG_0 = 8'b00011000;
// Pantalla Vivo/Muerto
 parameter DATA_FIXED_VM_Reg_JUG_7 = 8'b00001111;
 parameter DATA_FIXED_VM_Reg_JUG_6 = 8'b01101111;
 parameter DATA_FIXED_VM_Reg_JUG_5 = 8'b00001111;
 parameter DATA_FIXED_VM_Reg_JUG_4 = 8'b10011111;
 parameter DATA_FIXED_VM_Reg_JUG_3 = 8'b01101111;
 parameter DATA_FIXED_VM_Reg_JUG_2 = 8'b00001111;
 parameter DATA_FIXED_VM_Reg_JUG_1 = 8'b00001111;
 parameter DATA_FIXED_VM_Reg_JUG_0 = 8'b00001111;
// Pantalla Muerto/Vivo
 parameter DATA_FIXED_MV_Reg_JUG_7 = 8'b11110000;
 parameter DATA_FIXED_MV_Reg_JUG_6 = 8'b11110110;
 parameter DATA_FIXED_MV_Reg_JUG_5 = 8'b11110000;
 parameter DATA_FIXED_MV_Reg_JUG_4 = 8'b11111001;
 parameter DATA_FIXED_MV_Reg_JUG_3 = 8'b11110110;
 parameter DATA_FIXED_MV_Reg_JUG_2 = 8'b11110000;
 parameter DATA_FIXED_MV_Reg_JUG_1 = 8'b11110000;
 parameter DATA_FIXED_MV_Reg_JUG_0 = 8'b11110000;
 // Pantalla Vivo/Vivo
 parameter DATA_FIXED_GANADOR_Reg_JUG_7 = 8'b00000000;
 parameter DATA_FIXED_GANADOR_Reg_JUG_6 = 8'b00100100;
 parameter DATA_FIXED_GANADOR_Reg_JUG_5 = 8'b00100100;
 parameter DATA_FIXED_GANADOR_Reg_JUG_4 = 8'b00000000;
 parameter DATA_FIXED_GANADOR_Reg_JUG_3 = 8'b01000010;
 parameter DATA_FIXED_GANADOR_Reg_JUG_2 = 8'b00100100;
 parameter DATA_FIXED_GANADOR_Reg_JUG_1 = 8'b00111100;
 parameter DATA_FIXED_GANADOR_Reg_JUG_0 = 8'b00000000;


 //=======================================================
//  PORT declarations
//=======================================================
output		BB_SYSTEM_max7219DIN_Out;
output		BB_SYSTEM_max7219NCS_Out;
output		BB_SYSTEM_max7219CLK_Out;
output		BB_SYSTEM_display_OutBUS;

output 		BB_SYSTEM_startButton_Out;
output 		BB_SYSTEM_leftButton_jug1_Out;
output 		BB_SYSTEM_leftButton_jug2_Out;
output 		BB_SYSTEM_rightButton_jug1_Out;
output 		BB_SYSTEM_rightButton_jug2_Out;

output		BB_SYSTEM_TEST0;
output 		BB_SYSTEM_TEST1;
output 		BB_SYSTEM_TEST2;
output		BB_SYSTEM_TEST3;
output 		BB_SYSTEM_TEST4;
output 		BB_SYSTEM_TEST5;
output		BB_SYSTEM_TEST6;
output 		BB_SYSTEM_TEST7;



input		BB_SYSTEM_CLOCK_50;
input		BB_SYSTEM_RESET_InHigh;
input		BB_SYSTEM_startButton_InLow;
input		BB_SYSTEM_leftButton_jug1_InLow;
input		BB_SYSTEM_leftButton_jug2_InLow;
input		BB_SYSTEM_rightButton_jug1_InLow;
input		BB_SYSTEM_rightButton_jug2_InLow;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================
// BUTTONs
wire 	BB_SYSTEM_startButton_InLow_cwire;
wire 	BB_SYSTEM_rightButton_jug2_InLow_cwire;
wire 	BB_SYSTEM_leftButton_jug2_InLow_cwire;
wire 	BB_SYSTEM_rightButton_jug1_InLow_cwire;
wire 	BB_SYSTEM_leftButton_jug1_InLow_cwire;

//	JUGADOR 1
wire 	SC_STATEMACHINE_JUG1_clear0_cwire;
wire 	SC_STATEMACHINE_JUG1_load0_cwire;
wire 	[1:0] SC_STATEMACHINE_JUG1_shiftselection0_cwire;
wire  [DATAWIDTH_BUS-1:0] REGJUG1_COMPARATOR_cwire;
wire  CC_SIDECOMPARATOR_JUG1_derechaout_cwire;
wire  CC_SIDECOMPARATOR_JUG1_izquierdaout_cwire;
wire  CC_POSCOMPARATOR_JUG1_posicionout_cwire;


//	JUGADOR 2
wire 	SC_STATEMACHINE_JUG2_clear0_cwire;
wire 	SC_STATEMACHINE_JUG2_load0_cwire;
wire 	[1:0] SC_STATEMACHINE_JUG2_shiftselection0_cwire;
wire  [DATAWIDTH_BUS-1:0] REGJUG2_COMPARATOR_cwire;
wire  CC_SIDECOMPARATOR_JUG2_derechaout_cwire;
wire  CC_SIDECOMPARATOR_JUG2_izquierdaout_cwire;
wire  CC_POSCOMPARATOR_JUG2_posicionout_cwire;

// Contador Puntos
wire 	SC_STATEMACHINE_GENERAL_upcount0_cwire;
wire 	[DATAWIDTH_BUS-1:0] SC_POINTCOUNTER_data0_cwire;

//  Velocidad
wire 	SC_STATEMACHINE_GENERAL_upcount1_cwire;
wire 	[27:0] SC_SPEEDCOUNTER_speed_cwire;
wire	SC_STATEMACHINE_GENERAL_loadspeed_cwire;
wire	CC_SPEEDCOMPARATOR_speedout_cwire;
wire	SC_STATEMACHINE_GENERAL_RESETspeedCounter_cwire;
wire	[27:0]  SC_STATEMACHINE_GENERAL_speedlimit_cwire;

// Registros matriz y multiplexores
wire 	SC_STATEMACHINE_GENERAL_loadMATRIX_cwire;
wire 	[3:0] SC_STATEMACHINE_GENERAL_select_wire;
wire 	SC_STATEMACHINE_GENERAL_select0_wire;
wire	[DATAWIDTH_BUS-1:0] RANDOM_cwire;
wire	[DATAWIDTH_BUS-1:0] MUX16x1__07_cwire;
wire	[DATAWIDTH_BUS-1:0] MUX16x1__06_cwire;
wire	[DATAWIDTH_BUS-1:0] MUX16x1__05_cwire;
wire	[DATAWIDTH_BUS-1:0] MUX16x1__04_cwire;
wire	[DATAWIDTH_BUS-1:0] MUX16x1__03_cwire;
wire	[DATAWIDTH_BUS-1:0] MUX16x1__02_cwire;
wire	[DATAWIDTH_BUS-1:0] MUX16x1__01_cwire;
wire	[DATAWIDTH_BUS-1:0] MUX16x1__00_cwire;
wire 	[DATAWIDTH_BUS-1:0] Reg7_MATRIX_cwire;
wire 	[DATAWIDTH_BUS-1:0] Reg6_MATRIX_cwire;
wire 	[DATAWIDTH_BUS-1:0] Reg5_MATRIX_cwire;
wire 	[DATAWIDTH_BUS-1:0] Reg4_MATRIX_cwire;
wire 	[DATAWIDTH_BUS-1:0] Reg3_MATRIX_cwire;
wire 	[DATAWIDTH_BUS-1:0] Reg2_MATRIX_cwire;
wire 	[DATAWIDTH_BUS-1:0] Reg1_MATRIX_cwire;
wire 	[DATAWIDTH_BUS-1:0] Reg0_MATRIX_cwire;
wire 	[DATAWIDTH_BUS-1:0] Reg0_outBUS1_cwire;

//Ors

wire	[DATAWIDTH_BUS-1:0] CC_ORC_2_outBUS_cwire;
wire	[DATAWIDTH_BUS-1:0] CC_ORC_0_outBUS_cwire;
wire	[DATAWIDTH_BUS-1:0] CC_ORC_C_fila0_cwire;

//State Machine
wire	SC_STATEMACHINE_GENERAL_clear0_cwire;


wire SC_STATEMACHINE_GENERAL_upNIVEL_cwire;
wire [DATAWIDTH_BUS-1:0] SC_NIVELCOUNTER_cwire;

// GAME
wire [DATAWIDTH_BUS-1:0] regGAME_data7_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data6_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data5_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data4_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data3_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data2_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data1_wire;
wire [DATAWIDTH_BUS-1:0] regGAME_data0_wire;

wire 	[7:0] data_max;
wire 	[2:0] add;

//=======================================================
//  Structural coding
//=======================================================

//######################################################################
//#	INPUTS
//######################################################################
SC_DEBOUNCE1 SC_DEBOUNCE1_u0 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_startButton_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_startButton_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u1 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_leftButton_jug1_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_leftButton_jug1_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u2 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_rightButton_jug1_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_rightButton_jug1_InLow)
);

SC_DEBOUNCE1 SC_DEBOUNCE1_u3 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_leftButton_jug2_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_leftButton_jug2_InLow)
);
SC_DEBOUNCE1 SC_DEBOUNCE1_u4 (
// port map - connection between master ports and signals/registers   
	.SC_DEBOUNCE1_button_Out(BB_SYSTEM_rightButton_jug2_InLow_cwire),
	.SC_DEBOUNCE1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_DEBOUNCE1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_DEBOUNCE1_button_In(~BB_SYSTEM_rightButton_jug2_InLow)
);

//######################################################################
//#	!!! ACA VAN TUS COMPONENTES
//######################################################################
// Registros de jugador

SC_REGJUG #(.DATA_INIT_POS(8'b01000000)) SC_REGJUG_u0 (
// conexiones de entrada al registro del jugador 1
	.SC_REGJUG_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_REGJUG_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_REGJUG_clear_InLow(SC_STATEMACHINE_JUG1_clear0_cwire),
	.SC_REGJUG_shiftselection_In(SC_STATEMACHINE_JUG1_shiftselection0_cwire),
	.SC_REGJUG_data_OutBUS(REGJUG1_COMPARATOR_cwire)
	
);
SC_REGJUG #(.DATA_INIT_POS(8'b00000100)) SC_REGJUG_u1 (
	.SC_REGJUG_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_REGJUG_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_REGJUG_clear_InLow(SC_STATEMACHINE_JUG2_clear0_cwire),
	.SC_REGJUG_shiftselection_In(SC_STATEMACHINE_JUG2_shiftselection0_cwire),
	.SC_REGJUG_data_OutBUS(REGJUG2_COMPARATOR_cwire)
	
);

SC_STATEMACHINE_JUG1 SC_STATEMACHINE_JUG1_u1 (

	.SC_STATEMACHINE_JUG1_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINE_JUG1_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINE_JUG1_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINE_JUG1_leftButton_InLow(BB_SYSTEM_leftButton_jug1_InLow_cwire),
	.SC_STATEMACHINE_JUG1_rightButton_InLow(BB_SYSTEM_rightButton_jug1_InLow_cwire),
	.SC_STATEMACHINE_JUG1_izquierdacomparator_InLow(CC_SIDECOMPARATOR_JUG1_izquierdaout_cwire),
	.SC_STATEMACHINE_JUG1_derechacomparator_InLow(CC_SIDECOMPARATOR_JUG1_derechaout_cwire),
	.SC_STATEMACHINE_JUG1_clear_OutLow(SC_STATEMACHINE_JUG1_clear0_cwire),
	.SC_STATEMACHINE_JUG1_shiftselection_Out(SC_STATEMACHINE_JUG1_shiftselection0_cwire)

);

SC_STATEMACHINE_JUG2 SC_STATEMACHINE_JUG2_u1 (

	.SC_STATEMACHINE_JUG2_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINE_JUG2_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINE_JUG2_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	.SC_STATEMACHINE_JUG2_leftButton_InLow(BB_SYSTEM_leftButton_jug2_InLow_cwire),
	.SC_STATEMACHINE_JUG2_rightButton_InLow(BB_SYSTEM_rightButton_jug2_InLow_cwire),
	.SC_STATEMACHINE_JUG2_izquierdacomparator_InLow(CC_SIDECOMPARATOR_JUG2_izquierdaout_cwire),
	.SC_STATEMACHINE_JUG2_derechacomparator_InLow(CC_SIDECOMPARATOR_JUG2_derechaout_cwire),
	.SC_STATEMACHINE_JUG2_clear_OutLow(SC_STATEMACHINE_JUG2_clear0_cwire),
	.SC_STATEMACHINE_JUG2_shiftselection_Out(SC_STATEMACHINE_JUG2_shiftselection0_cwire)

);

//Comparadores LADOS del jugador

CC_SIDECOMPARATOR_JUG1 CC_SIDECOMPARATOR_JUG1_u1 (

	.CC_SIDECOMPARATOR_JUG1_data_InBUS(REGJUG1_COMPARATOR_cwire),
	.CC_SIDECOMPARATOR_JUG1_derecha_OutLow(CC_SIDECOMPARATOR_JUG1_derechaout_cwire),
	.CC_SIDECOMPARATOR_JUG1_izquierda_OutLow(CC_SIDECOMPARATOR_JUG1_izquierdaout_cwire)
);


CC_SIDECOMPARATOR_JUG2 CC_SIDECOMPARATOR_JUG2_u1 (

	.CC_SIDECOMPARATOR_JUG2_data_InBUS(REGJUG2_COMPARATOR_cwire),
	.CC_SIDECOMPARATOR_JUG2_derecha_OutLow(CC_SIDECOMPARATOR_JUG2_derechaout_cwire),
	.CC_SIDECOMPARATOR_JUG2_izquierda_OutLow(CC_SIDECOMPARATOR_JUG2_izquierdaout_cwire)
);


//Comparadores POSICION del jugador con la matriz

CC_PosCOMPARATOR_JUG1 CC_PosCOMPARATOR_JUG1_u1 (

	.CC_PosCOMPARATOR_JUG1_posjug1(REGJUG1_COMPARATOR_cwire),
	.CC_PosCOMPARATOR_JUG1_fila0(Reg0_outBUS1_cwire),
	.CC_PosCOMPARATOR_JUG1_OutBUS(CC_POSCOMPARATOR_JUG1_posicionout_cwire)
);

CC_PosCOMPARATOR_JUG2 CC_PosCOMPARATOR_JUG2_u1 (
	
	.CC_PosCOMPARATOR_JUG2_posjug2(REGJUG2_COMPARATOR_cwire),
	.CC_PosCOMPARATOR_JUG2_fila0(Reg0_outBUS1_cwire),
	.CC_PosCOMPARATOR_JUG2_OutBUS(CC_POSCOMPARATOR_JUG2_posicionout_cwire)
);

//Contador Puntos

SC_POINTCOUNTER SC_POINTCOUNTER_u1 (
	.SC_POINTCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_POINTCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_POINTCOUNTER_upcount_InLow(SC_STATEMACHINE_GENERAL_upcount0_cwire),
	.SC_POINTCOUNTER_data_OutBUS(SC_POINTCOUNTER_data0_cwire)

);

SC_POINTCOUNTER SC_NIVELCOUNTER (
	.SC_POINTCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_POINTCOUNTER_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_POINTCOUNTER_upcount_InLow(SC_STATEMACHINE_GENERAL_upNIVEL_cwire),
	.SC_POINTCOUNTER_data_OutBUS(SC_NIVELCOUNTER_cwire)

);

//Contador de la VELOCIDAD
SC_SPEEDCOUNTER SC_SPEEDCOUNTER_u1 (

	.SC_SPEEDCOUNTER_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_SPEEDCOUNTER_RESET_InHigh(SC_STATEMACHINE_GENERAL_RESETspeedCounter_cwire),
	.SC_SPEEDCOUNTER_upcount_InLow(SC_STATEMACHINE_GENERAL_upcount1_cwire),
	.SC_SPEEDCOUNTER_data_OutBUS(SC_SPEEDCOUNTER_speed_cwire)

);

//Comparador de la VELOCIDAD

CC_SPEEDCOMPARATOR CC_SPEEDCOMPARATOR_u1(
	.CC_SPEEDCOMPARATOR_data_InBUS(SC_SPEEDCOUNTER_speed_cwire),
	.CC_SPEEDCOMPARATOR_limit_InBUS(SC_STATEMACHINE_GENERAL_speedlimit_cwire),
	.CC_SPEEDCOMPARATOR_loadSignal_InLow(SC_STATEMACHINE_GENERAL_loadspeed_cwire),
	.CC_SPEEDCOMPARATOR_signal_OutLow(CC_SPEEDCOMPARATOR_speedout_cwire)

);

//Conexiones registro de la matriz

SC_Reg_MATRIX SC_Reg_MATRIX_u7 (
	.SC_Reg_MATRIX_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_Reg_MATRIX_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_Reg_MATRIX_clear_InLow(SC_STATEMACHINE_GENERAL_clear0_cwire),
	.SC_Reg_MATRIX_load0_InLow(SC_STATEMACHINE_GENERAL_loadMATRIX_cwire),
	.SC_Reg_MATRIX_data0_InBUS(MUX16x1__07_cwire),
	.SC_Reg_MATRIX_data_OutBUS(Reg7_MATRIX_cwire)
);


SC_Reg_MATRIX SC_Reg_MATRIX_u6 (
	.SC_Reg_MATRIX_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_Reg_MATRIX_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_Reg_MATRIX_clear_InLow(SC_STATEMACHINE_GENERAL_clear0_cwire),
	.SC_Reg_MATRIX_load0_InLow(SC_STATEMACHINE_GENERAL_loadMATRIX_cwire),
	.SC_Reg_MATRIX_data0_InBUS(MUX16x1__06_cwire),
	.SC_Reg_MATRIX_data_OutBUS(Reg6_MATRIX_cwire)
	
);

SC_Reg_MATRIX SC_Reg_MATRIX_u5 (
	.SC_Reg_MATRIX_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_Reg_MATRIX_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_Reg_MATRIX_clear_InLow(SC_STATEMACHINE_GENERAL_clear0_cwire),
	.SC_Reg_MATRIX_load0_InLow(SC_STATEMACHINE_GENERAL_loadMATRIX_cwire),
	.SC_Reg_MATRIX_data0_InBUS(MUX16x1__05_cwire),
	.SC_Reg_MATRIX_data_OutBUS(Reg5_MATRIX_cwire)
	
);

SC_Reg_MATRIX SC_Reg_MATRIX_u4 (
	.SC_Reg_MATRIX_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_Reg_MATRIX_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_Reg_MATRIX_clear_InLow(SC_STATEMACHINE_GENERAL_clear0_cwire),
	.SC_Reg_MATRIX_load0_InLow(SC_STATEMACHINE_GENERAL_loadMATRIX_cwire),
	.SC_Reg_MATRIX_data0_InBUS(MUX16x1__04_cwire),
	.SC_Reg_MATRIX_data_OutBUS(Reg4_MATRIX_cwire)
	
);

SC_Reg_MATRIX SC_Reg_MATRIX_u3 (
	.SC_Reg_MATRIX_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_Reg_MATRIX_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_Reg_MATRIX_clear_InLow(SC_STATEMACHINE_GENERAL_clear0_cwire),
	.SC_Reg_MATRIX_load0_InLow(SC_STATEMACHINE_GENERAL_loadMATRIX_cwire),
	.SC_Reg_MATRIX_data0_InBUS(MUX16x1__03_cwire),
	.SC_Reg_MATRIX_data_OutBUS(Reg3_MATRIX_cwire)
	
);

SC_Reg_MATRIX SC_Reg_MATRIX_u2 (
	.SC_Reg_MATRIX_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_Reg_MATRIX_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_Reg_MATRIX_clear_InLow(SC_STATEMACHINE_GENERAL_clear0_cwire),
	.SC_Reg_MATRIX_load0_InLow(SC_STATEMACHINE_GENERAL_loadMATRIX_cwire),
	.SC_Reg_MATRIX_data0_InBUS(MUX16x1__02_cwire),
	.SC_Reg_MATRIX_data_OutBUS(Reg2_MATRIX_cwire)
	
);

SC_Reg_MATRIX SC_Reg_MATRIX_u1 (
	.SC_Reg_MATRIX_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_Reg_MATRIX_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_Reg_MATRIX_clear_InLow(SC_STATEMACHINE_GENERAL_clear0_cwire),
	.SC_Reg_MATRIX_load0_InLow(SC_STATEMACHINE_GENERAL_loadMATRIX_cwire),
	.SC_Reg_MATRIX_data0_InBUS(MUX16x1__01_cwire),
	.SC_Reg_MATRIX_data_OutBUS(Reg1_MATRIX_cwire)
	
);

SC_Reg_MATRIX SC_Reg_MATRIX_u0 (

	.SC_Reg_MATRIX_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_Reg_MATRIX_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_Reg_MATRIX_clear_InLow(SC_STATEMACHINE_GENERAL_clear0_cwire),
	.SC_Reg_MATRIX_load0_InLow(SC_STATEMACHINE_GENERAL_loadMATRIX_cwire),
	.SC_Reg_MATRIX_data0_InBUS(MUX16x1__00_cwire),
	.SC_Reg_MATRIX_data_OutBUS(Reg0_outBUS1_cwire)
	
);

//RANDOM

SC_RANDOM SC_RANDOM_u0 (
	.SC_RANDOM_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_RANDOM_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_RANDOM_data_OutBUS(RANDOM_cwire)
);



//Multiplexor de 16 a 1

CC_MUX16X1 CC_MUX16X1_u7 (
	.CC_MUX16X1_select_InBUS(SC_STATEMACHINE_GENERAL_select_wire),
	.CC_MUX16X1_data1_InBUS(DATA_FIXED_INITReg_JUG_7),
	.CC_MUX16X1_data2_InBUS(DATA_FIXED_GO_Reg_JUG_7),
	.CC_MUX16X1_data3_InBUS(DATA_FIXED_L1_Reg_JUG_7),
	.CC_MUX16X1_data4_InBUS(DATA_FIXED_L2_Reg_JUG_7),
	.CC_MUX16X1_data5_InBUS(DATA_FIXED_L3_Reg_JUG_7),
	.CC_MUX16X1_data6_InBUS(DATA_FIXED_VM_Reg_JUG_7),
	.CC_MUX16X1_data7_InBUS(DATA_FIXED_MV_Reg_JUG_7),
	.CC_MUX16X1_data8_InBUS(DATA_FIXED_GANADOR_Reg_JUG_7),
	.CC_MUX16X1_data9_InBUS(DATA_FIXED_ESPReg_JUG_7),
	.CC_MUX16X1_data10_InBUS(RANDOM_cwire),
	.CC_MUX16X1_z_Out(MUX16x1__07_cwire)
);

CC_MUX16X1 CC_MUX16X1_u6 (
	.CC_MUX16X1_select_InBUS(SC_STATEMACHINE_GENERAL_select_wire),
	.CC_MUX16X1_data1_InBUS(DATA_FIXED_INITReg_JUG_6),
	.CC_MUX16X1_data2_InBUS(DATA_FIXED_GO_Reg_JUG_6),
	.CC_MUX16X1_data3_InBUS(DATA_FIXED_L1_Reg_JUG_6),
	.CC_MUX16X1_data4_InBUS(DATA_FIXED_L2_Reg_JUG_6),
	.CC_MUX16X1_data5_InBUS(DATA_FIXED_L3_Reg_JUG_6),
	.CC_MUX16X1_data6_InBUS(DATA_FIXED_VM_Reg_JUG_6),
	.CC_MUX16X1_data7_InBUS(DATA_FIXED_MV_Reg_JUG_6),
	.CC_MUX16X1_data8_InBUS(DATA_FIXED_GANADOR_Reg_JUG_6),
	.CC_MUX16X1_data9_InBUS(Reg7_MATRIX_cwire),
	.CC_MUX16X1_data10_InBUS(Reg7_MATRIX_cwire),
	.CC_MUX16X1_z_Out(MUX16x1__06_cwire)
);

CC_MUX16X1 CC_MUX16X1_u5 (
	.CC_MUX16X1_select_InBUS(SC_STATEMACHINE_GENERAL_select_wire),
	.CC_MUX16X1_data1_InBUS(DATA_FIXED_INITReg_JUG_5),
	.CC_MUX16X1_data2_InBUS(DATA_FIXED_GO_Reg_JUG_5),
	.CC_MUX16X1_data3_InBUS(DATA_FIXED_L1_Reg_JUG_5),
	.CC_MUX16X1_data4_InBUS(DATA_FIXED_L2_Reg_JUG_5),
	.CC_MUX16X1_data5_InBUS(DATA_FIXED_L3_Reg_JUG_5),
	.CC_MUX16X1_data6_InBUS(DATA_FIXED_VM_Reg_JUG_5),
	.CC_MUX16X1_data7_InBUS(DATA_FIXED_MV_Reg_JUG_5),
	.CC_MUX16X1_data8_InBUS(DATA_FIXED_GANADOR_Reg_JUG_5),
	.CC_MUX16X1_data9_InBUS(Reg6_MATRIX_cwire),
	.CC_MUX16X1_data10_InBUS(Reg6_MATRIX_cwire),
	.CC_MUX16X1_z_Out(MUX16x1__05_cwire)
);
CC_MUX16X1 CC_MUX16X1_u4 (
	.CC_MUX16X1_select_InBUS(SC_STATEMACHINE_GENERAL_select_wire),
	.CC_MUX16X1_data1_InBUS(DATA_FIXED_INITReg_JUG_4),
	.CC_MUX16X1_data2_InBUS(DATA_FIXED_GO_Reg_JUG_4),
	.CC_MUX16X1_data3_InBUS(DATA_FIXED_L1_Reg_JUG_4),
	.CC_MUX16X1_data4_InBUS(DATA_FIXED_L2_Reg_JUG_4),
	.CC_MUX16X1_data5_InBUS(DATA_FIXED_L3_Reg_JUG_4),
	.CC_MUX16X1_data6_InBUS(DATA_FIXED_VM_Reg_JUG_4),
	.CC_MUX16X1_data7_InBUS(DATA_FIXED_MV_Reg_JUG_4),
	.CC_MUX16X1_data8_InBUS(DATA_FIXED_GANADOR_Reg_JUG_4),
	.CC_MUX16X1_data9_InBUS(Reg5_MATRIX_cwire),
	.CC_MUX16X1_data10_InBUS(Reg5_MATRIX_cwire),
	.CC_MUX16X1_z_Out(MUX16x1__04_cwire)
);

CC_MUX16X1 CC_MUX16X1_u3 (
	.CC_MUX16X1_select_InBUS(SC_STATEMACHINE_GENERAL_select_wire),
	.CC_MUX16X1_data1_InBUS(DATA_FIXED_INITReg_JUG_3),
	.CC_MUX16X1_data2_InBUS(DATA_FIXED_GO_Reg_JUG_3),
	.CC_MUX16X1_data3_InBUS(DATA_FIXED_L1_Reg_JUG_3),
	.CC_MUX16X1_data4_InBUS(DATA_FIXED_L2_Reg_JUG_3),
	.CC_MUX16X1_data5_InBUS(DATA_FIXED_L3_Reg_JUG_3),
	.CC_MUX16X1_data6_InBUS(DATA_FIXED_VM_Reg_JUG_3),
	.CC_MUX16X1_data7_InBUS(DATA_FIXED_MV_Reg_JUG_3),
	.CC_MUX16X1_data8_InBUS(DATA_FIXED_GANADOR_Reg_JUG_3),
	.CC_MUX16X1_data9_InBUS(Reg4_MATRIX_cwire),
	.CC_MUX16X1_data10_InBUS(Reg4_MATRIX_cwire),
	.CC_MUX16X1_z_Out(MUX16x1__03_cwire)
);
CC_MUX16X1 CC_MUX16X1_u2 (
	.CC_MUX16X1_select_InBUS(SC_STATEMACHINE_GENERAL_select_wire),
	.CC_MUX16X1_data1_InBUS(DATA_FIXED_INITReg_JUG_2),
	.CC_MUX16X1_data2_InBUS(DATA_FIXED_GO_Reg_JUG_2),
	.CC_MUX16X1_data3_InBUS(DATA_FIXED_L1_Reg_JUG_2),
	.CC_MUX16X1_data4_InBUS(DATA_FIXED_L2_Reg_JUG_2),
	.CC_MUX16X1_data5_InBUS(DATA_FIXED_L3_Reg_JUG_2),
	.CC_MUX16X1_data6_InBUS(DATA_FIXED_VM_Reg_JUG_2),
	.CC_MUX16X1_data7_InBUS(DATA_FIXED_MV_Reg_JUG_2),
	.CC_MUX16X1_data8_InBUS(DATA_FIXED_GANADOR_Reg_JUG_2),
	.CC_MUX16X1_data9_InBUS(Reg3_MATRIX_cwire),
	.CC_MUX16X1_data10_InBUS(Reg3_MATRIX_cwire),
	.CC_MUX16X1_z_Out(MUX16x1__02_cwire)
);

CC_MUX16X1 CC_MUX16X1_u1 (
	.CC_MUX16X1_select_InBUS(SC_STATEMACHINE_GENERAL_select_wire),
	.CC_MUX16X1_data1_InBUS(DATA_FIXED_INITReg_JUG_1),
	.CC_MUX16X1_data2_InBUS(DATA_FIXED_GO_Reg_JUG_1),
	.CC_MUX16X1_data3_InBUS(DATA_FIXED_L1_Reg_JUG_1),
	.CC_MUX16X1_data4_InBUS(DATA_FIXED_L2_Reg_JUG_1),
	.CC_MUX16X1_data5_InBUS(DATA_FIXED_L3_Reg_JUG_1),
	.CC_MUX16X1_data6_InBUS(DATA_FIXED_VM_Reg_JUG_1),
	.CC_MUX16X1_data7_InBUS(DATA_FIXED_MV_Reg_JUG_1),
	.CC_MUX16X1_data8_InBUS(DATA_FIXED_GANADOR_Reg_JUG_1),
	.CC_MUX16X1_data9_InBUS(Reg2_MATRIX_cwire),
	.CC_MUX16X1_data10_InBUS(Reg2_MATRIX_cwire),
	.CC_MUX16X1_z_Out(MUX16x1__01_cwire)
);
CC_MUX16X1 CC_MUX16X1_u0 (
	.CC_MUX16X1_select_InBUS(SC_STATEMACHINE_GENERAL_select_wire),
	.CC_MUX16X1_data1_InBUS(DATA_FIXED_INITReg_JUG_0),
	.CC_MUX16X1_data2_InBUS(DATA_FIXED_GO_Reg_JUG_0),
	.CC_MUX16X1_data3_InBUS(DATA_FIXED_L1_Reg_JUG_0),
	.CC_MUX16X1_data4_InBUS(DATA_FIXED_L2_Reg_JUG_0),
	.CC_MUX16X1_data5_InBUS(DATA_FIXED_L3_Reg_JUG_0),
	.CC_MUX16X1_data6_InBUS(DATA_FIXED_VM_Reg_JUG_0),
	.CC_MUX16X1_data7_InBUS(DATA_FIXED_MV_Reg_JUG_0),
	.CC_MUX16X1_data8_InBUS(DATA_FIXED_GANADOR_Reg_JUG_0),
	.CC_MUX16X1_data9_InBUS(Reg1_MATRIX_cwire),
	.CC_MUX16X1_data10_InBUS(Reg1_MATRIX_cwire),
	.CC_MUX16X1_z_Out(MUX16x1__00_cwire)
);

//ORs

CC_OR_C CC_OR_C_u2 (
	.CC_OR_C_data0_In(REGJUG1_COMPARATOR_cwire),
	.CC_OR_C_data1_In(Reg0_outBUS1_cwire),
	.CC_OR_C_z_Out(CC_ORC_2_outBUS_cwire)
);

CC_OR_C CC_OR_C_u1 (
	.CC_OR_C_data0_In(CC_ORC_2_outBUS_cwire),
	.CC_OR_C_data1_In(CC_ORC_0_outBUS_cwire),
	.CC_OR_C_z_Out(CC_ORC_C_fila0_cwire)
);

CC_OR_C CC_OR_C_u0 (
	.CC_OR_C_data0_In(REGJUG2_COMPARATOR_cwire),
	.CC_OR_C_data1_In(Reg0_outBUS1_cwire),
	.CC_OR_C_z_Out(CC_ORC_0_outBUS_cwire)
);

//Multiplexor 2x1

CC_MUX_21 CC_MUX21_u1 (

	.CC_MUX_21_select_InBUS(SC_STATEMACHINE_GENERAL_select0_wire),
	.CC_MUX_21_data1_InBUS(Reg0_outBUS1_cwire),
	.CC_MUX_21_data2_InBUS(CC_ORC_C_fila0_cwire),
	//.CC_MUX_21_z_Out(BB_SYSTEM_TEST0)
	.CC_MUX_21_z_Out(Reg0_MATRIX_cwire)
	
);

//State Machine GENERAL

SC_STATEMACHINE_GENERAL SC_STATEMACHINE_GENERAL_u0 (
	.SC_STATEMACHINE_GENERAL_CLOCK_50(BB_SYSTEM_CLOCK_50),
	.SC_STATEMACHINE_GENERAL_RESET_InHigh(BB_SYSTEM_RESET_InHigh),
	.SC_STATEMACHINE_GENERAL_startButton_InLow(BB_SYSTEM_startButton_InLow_cwire),
	//.SC_STATEMACHINE_GENERAL_timer_InLow(),
	.SC_STATEMACHINE_GENERAL_speedComparator_InLow(CC_SPEEDCOMPARATOR_speedout_cwire),
	.SC_STATEMACHINE_GENERAL_posJug1_InLow(CC_POSCOMPARATOR_JUG1_posicionout_cwire),
	.SC_STATEMACHINE_GENERAL_posJug2_InLow(CC_POSCOMPARATOR_JUG2_posicionout_cwire),
	.SC_STATEMACHINE_GENERAL_pointCounter_InBUS(SC_POINTCOUNTER_data0_cwire),
	.SC_STATEMACHINE_GENERAL_clear_OutLow(SC_STATEMACHINE_GENERAL_clear0_cwire),
	.SC_STATEMACHINE_GENERAL_load0_OutLow(SC_STATEMACHINE_GENERAL_loadMATRIX_cwire),
	.SC_STATEMACHINE_GENERAL_speedCounter_OutLow(SC_STATEMACHINE_GENERAL_upcount1_cwire),
	.SC_STATEMACHINE_GENERAL_speedReset_OutHigh(SC_STATEMACHINE_GENERAL_RESETspeedCounter_cwire),
	.SC_STATEMACHINE_GENERAL_speedComparator_OutBUS(SC_STATEMACHINE_GENERAL_speedlimit_cwire),
	.SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow(SC_STATEMACHINE_GENERAL_loadspeed_cwire),
	.SC_STATEMACHINE_GENERAL_pointSignal_OutLow(SC_STATEMACHINE_GENERAL_upcount0_cwire),
	.SC_STATEMACHINE_GENERAL_mux0_OutBUS(SC_STATEMACHINE_GENERAL_select_wire),
	.SC_STATEMACHINE_GENERAL_mux8_OutBUS(SC_STATEMACHINE_GENERAL_select0_wire),
	//.SC_STATEMACHINE_GENERAL_random_OutLow(),
	.SC_STATEMACHINE_GENERAL_STATE_OutBUS(),
	.SC_STATEMACHINE_GENERAL_nivelCounter_InBUS(SC_NIVELCOUNTER_cwire),
	.SC_STATEMACHINE_GENERAL_upNivelCounter_OutLow(SC_STATEMACHINE_GENERAL_upNIVEL_cwire)
	
	

);


//######################################################################
//#	TO LED MATRIZ: VISUALIZATION
//######################################################################
assign regGAME_data0_wire = Reg0_MATRIX_cwire;
assign regGAME_data1_wire = Reg1_MATRIX_cwire;
assign regGAME_data2_wire = Reg2_MATRIX_cwire;
assign regGAME_data3_wire = Reg3_MATRIX_cwire;
assign regGAME_data4_wire = Reg4_MATRIX_cwire;
assign regGAME_data5_wire = Reg5_MATRIX_cwire;
assign regGAME_data6_wire = Reg6_MATRIX_cwire;
assign regGAME_data7_wire = Reg7_MATRIX_cwire;

assign data_max =(add==3'b000)?{regGAME_data0_wire[7],regGAME_data1_wire[7],regGAME_data2_wire[7],regGAME_data3_wire[7],regGAME_data4_wire[7],regGAME_data5_wire[7],regGAME_data6_wire[7],regGAME_data7_wire[7]}:
	       (add==3'b001)?{regGAME_data0_wire[6],regGAME_data1_wire[6],regGAME_data2_wire[6],regGAME_data3_wire[6],regGAME_data4_wire[6],regGAME_data5_wire[6],regGAME_data6_wire[6],regGAME_data7_wire[6]}:
	       (add==3'b010)?{regGAME_data0_wire[5],regGAME_data1_wire[5],regGAME_data2_wire[5],regGAME_data3_wire[5],regGAME_data4_wire[5],regGAME_data5_wire[5],regGAME_data6_wire[5],regGAME_data7_wire[5]}:
	       (add==3'b011)?{regGAME_data0_wire[4],regGAME_data1_wire[4],regGAME_data2_wire[4],regGAME_data3_wire[4],regGAME_data4_wire[4],regGAME_data5_wire[4],regGAME_data6_wire[4],regGAME_data7_wire[4]}:
	       (add==3'b100)?{regGAME_data0_wire[3],regGAME_data1_wire[3],regGAME_data2_wire[3],regGAME_data3_wire[3],regGAME_data4_wire[3],regGAME_data5_wire[3],regGAME_data6_wire[3],regGAME_data7_wire[3]}:
	       (add==3'b101)?{regGAME_data0_wire[2],regGAME_data1_wire[2],regGAME_data2_wire[2],regGAME_data3_wire[2],regGAME_data4_wire[2],regGAME_data5_wire[2],regGAME_data6_wire[2],regGAME_data7_wire[2]}:
	       (add==3'b110)?{regGAME_data0_wire[1],regGAME_data1_wire[1],regGAME_data2_wire[1],regGAME_data3_wire[1],regGAME_data4_wire[1],regGAME_data5_wire[1],regGAME_data6_wire[1],regGAME_data7_wire[1]}:
						{regGAME_data0_wire[0],regGAME_data1_wire[0],regGAME_data2_wire[0],regGAME_data3_wire[0],regGAME_data4_wire[0],regGAME_data5_wire[0],regGAME_data6_wire[0],regGAME_data7_wire[0]};
									 
matrix_ctrl matrix_ctrl_unit_0( 
.max7219_din(BB_SYSTEM_max7219DIN_Out),//max7219_din 
.max7219_ncs(BB_SYSTEM_max7219NCS_Out),//max7219_ncs 
.max7219_clk(BB_SYSTEM_max7219CLK_Out),//max7219_clk
.disp_data(data_max), 
.disp_addr(add),
.intensity(4'hA),
.clk(BB_SYSTEM_CLOCK_50),
.reset(BB_SYSTEM_RESET_InHigh) //~lowRst_System
 ); 
 
//######################################################################
//#	TO TEST
//######################################################################

assign BB_SYSTEM_startButton_Out = BB_SYSTEM_startButton_InLow_cwire;
assign BB_SYSTEM_leftButton_jug1_Out = BB_SYSTEM_leftButton_jug1_InLow_cwire;
assign BB_SYSTEM_rightButton_jug1_Out = BB_SYSTEM_rightButton_jug1_InLow_cwire;
assign BB_SYSTEM_leftButton_jug2_Out = BB_SYSTEM_leftButton_jug2_InLow_cwire;
assign BB_SYSTEM_rightButton_jug2_Out = BB_SYSTEM_rightButton_jug2_InLow_cwire;

//TO TEST
assign BB_SYSTEM_TEST0 = Reg0_MATRIX_cwire[0];
assign BB_SYSTEM_TEST1 = Reg0_MATRIX_cwire[1];
assign BB_SYSTEM_TEST2 = Reg0_MATRIX_cwire[2];
assign BB_SYSTEM_TEST3 = Reg0_MATRIX_cwire[3];
assign BB_SYSTEM_TEST4 = Reg0_MATRIX_cwire[4];
assign BB_SYSTEM_TEST5 = Reg0_MATRIX_cwire[5];
assign BB_SYSTEM_TEST6 = Reg0_MATRIX_cwire[6];
assign BB_SYSTEM_TEST7 = Reg0_MATRIX_cwire[7];



endmodule