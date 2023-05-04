///*######################################################################
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
module SC_STATEMACHINE_GENERAL (
	//////////// OUTPUTS //////////
	SC_STATEMACHINE_GENERAL_clear_OutLow,
	SC_STATEMACHINE_GENERAL_load0_OutLow,
	SC_STATEMACHINE_GENERAL_speedCounter_OutLow,
	SC_STATEMACHINE_GENERAL_speedReset_OutHigh,
	SC_STATEMACHINE_GENERAL_speedComparator_OutBUS,

	SC_STATEMACHINE_GENERAL_pointSignal_OutLow,

	SC_STATEMACHINE_GENERAL_mux0_OutBUS,
	SC_STATEMACHINE_GENERAL_mux8_OutBUS,

	SC_STATEMACHINE_GENERAL_random_OutLow,

	SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow,

	SC_STATEMACHINE_GENERAL_STATE_OutBUS,

	//////////// INPUTS //////////
	SC_STATEMACHINE_GENERAL_CLOCK_50,
	SC_STATEMACHINE_GENERAL_RESET_InHigh,
	SC_STATEMACHINE_GENERAL_startButton_InLow,
	SC_STATEMACHINE_GENERAL_timer_InLow,
	SC_STATEMACHINE_GENERAL_speedComparator_InLow,
	SC_STATEMACHINE_GENERAL_posJug1_InLow,
	SC_STATEMACHINE_GENERAL_posJug2_InLow,
	SC_STATEMACHINE_GENERAL_pointCounter_InBUS
);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0										= 0;
localparam STATE_START_0										= 1;
localparam STATE_GO_0											= 2;
localparam STATE_esperarGO_0									= 3;
localparam STATE_NIVEL_1										= 4;
localparam STATE_esperarNIVEL_1								= 5;
localparam STATE_setSpeed_n1									= 6;
localparam STATE_NIVEL_2										= 7;
localparam STATE_esperarNIVEL_2								= 8;
localparam STATE_setSpeed_n2									= 9;
localparam STATE_NIVEL_3										= 10;
localparam STATE_esperarNIVEL_3								= 11;
localparam STATE_setSpeed_n3									= 12;
localparam STATE_lose_jug1										= 13;
localparam STATE_esperarLose_jug1								= 14;
localparam STATE_lose_jug2										= 15;
localparam STATE_esperarLose_jug2								= 16;
localparam STATE_sumarCarros_0								= 17;
localparam STATE_moverCarros_0								= 18;
localparam STATE_esperar_0										= 19;
localparam STATE_esperar_1										= 20;
localparam STATE_FIN												= 21;

//=======================================================
//  PORT declarations
//=======================================================
output reg		SC_STATEMACHINE_GENERAL_clear_OutLow;
output reg		SC_STATEMACHINE_GENERAL_load0_OutLow;
output reg		SC_STATEMACHINE_GENERAL_random_OutLow;
output reg		SC_STATEMACHINE_GENERAL_speedCounter_OutLow;
output reg		SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow;
output reg		SC_STATEMACHINE_GENERAL_speedReset_OutHigh;

output reg		SC_STATEMACHINE_GENERAL_pointSignal_OutLow;
output reg		[27:0] SC_STATEMACHINE_GENERAL_speedComparator_OutBUS;

output reg		[3:0] SC_STATEMACHINE_GENERAL_mux0_OutBUS;
output reg		SC_STATEMACHINE_GENERAL_mux8_OutBUS;

output reg		[4:0] SC_STATEMACHINE_GENERAL_STATE_OutBUS;




input			SC_STATEMACHINE_GENERAL_CLOCK_50;
input 		SC_STATEMACHINE_GENERAL_RESET_InHigh;
input			SC_STATEMACHINE_GENERAL_startButton_InLow;
//input			SC_STATEMACHINE_JUG1_ready_InLow;
//inp	SC_STATEMACHINE_JUG2_ready_InLow;
input			SC_STATEMACHINE_GENERAL_speedComparator_InLow;
input			SC_STATEMACHINE_GENERAL_posJug1_InLow;
input			SC_STATEMACHINE_GENERAL_posJug2_InLow;
input			SC_STATEMACHINE_GENERAL_timer_InLow;
input 		[7:0] SC_STATEMACHINE_GENERAL_pointCounter_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [4:0] STATE_Register;
reg [4:0] STATE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
// NEXT STATE LOGIC : COMBINATIONAL
always @(*)
begin
	case (STATE_Register)
		STATE_RESET_0:	STATE_Signal = STATE_START_0;

		STATE_START_0:	if (SC_STATEMACHINE_GENERAL_startButton_InLow == 1'b0) STATE_Signal = STATE_GO_0;
						else STATE_Signal = STATE_START_0;

		STATE_GO_0:		STATE_Signal = STATE_esperarGO_0;
		STATE_esperarGO_0:	if (SC_STATEMACHINE_GENERAL_speedComparator_InLow == 1'b0) STATE_Signal = STATE_NIVEL_1;
							else STATE_Signal = STATE_esperarGO_0;

		STATE_NIVEL_1:				STATE_Signal = STATE_esperarNIVEL_1;
		STATE_esperarNIVEL_1:		if (SC_STATEMACHINE_GENERAL_speedComparator_InLow == 1'b0) 
										STATE_Signal = STATE_setSpeed_n1;
									else 
										STATE_Signal = STATE_esperarNIVEL_1;
		STATE_setSpeed_n1:	STATE_Signal = STATE_sumarCarros_0;


		STATE_NIVEL_2:			STATE_Signal = STATE_esperarNIVEL_2;
		STATE_esperarNIVEL_2:	if (SC_STATEMACHINE_GENERAL_speedComparator_InLow == 1'b0) 
									STATE_Signal = STATE_setSpeed_n2;
								else 
									STATE_Signal = STATE_esperarNIVEL_2;
		STATE_setSpeed_n2:				STATE_Signal = STATE_sumarCarros_0;

		STATE_NIVEL_3:				STATE_Signal = STATE_esperarNIVEL_3;
		STATE_esperarNIVEL_3:	if (SC_STATEMACHINE_GENERAL_speedComparator_InLow == 1'b0) 
									STATE_Signal = STATE_setSpeed_n3;
								else 
									STATE_Signal = STATE_esperarNIVEL_3;
		STATE_setSpeed_n3:				STATE_Signal = STATE_sumarCarros_0;

		STATE_lose_jug1:		STATE_Signal = STATE_esperarLose_jug1;	
		STATE_esperarLose_jug1:	if (SC_STATEMACHINE_GENERAL_speedComparator_InLow == 1'b0) 
									STATE_Signal = STATE_START_0;
								else 
									STATE_Signal = STATE_lose_jug1;
		STATE_lose_jug2:		STATE_Signal = STATE_esperarLose_jug2;	
		STATE_esperarLose_jug2:	if (SC_STATEMACHINE_GENERAL_speedComparator_InLow == 1'b0) 
									STATE_Signal = STATE_START_0;
								else 
									STATE_Signal = STATE_lose_jug2;

		STATE_moverCarros_0: STATE_Signal = STATE_esperar_1;
		STATE_sumarCarros_0: STATE_Signal = STATE_esperar_0;

		STATE_esperar_0:if (SC_STATEMACHINE_GENERAL_posJug1_InLow == 1'b0) 
							STATE_Signal = STATE_lose_jug1;
						else if (SC_STATEMACHINE_GENERAL_posJug2_InLow == 1'b0) 
							STATE_Signal = STATE_lose_jug2;
						else if (SC_STATEMACHINE_GENERAL_pointCounter_InBUS >= 8'b10000000) 
							STATE_Signal = STATE_FIN;
						else if (SC_STATEMACHINE_GENERAL_pointCounter_InBUS >= 8'b01000000) 
							STATE_Signal = STATE_NIVEL_3;
						else if (SC_STATEMACHINE_GENERAL_pointCounter_InBUS >= 8'b00100000)
							STATE_Signal = STATE_NIVEL_2;
						else if (SC_STATEMACHINE_GENERAL_speedComparator_InLow == 1'b0)
							STATE_Signal = STATE_moverCarros_0;
						else 
							STATE_Signal = STATE_esperar_0;
		STATE_esperar_1:if (SC_STATEMACHINE_GENERAL_posJug1_InLow == 1'b0) 
							STATE_Signal = STATE_lose_jug1;
						else if (SC_STATEMACHINE_GENERAL_posJug2_InLow == 1'b0) 
							STATE_Signal = STATE_lose_jug2;
						else if (SC_STATEMACHINE_GENERAL_pointCounter_InBUS >= 8'b10000000) 
							STATE_Signal = STATE_FIN;
						else if (SC_STATEMACHINE_GENERAL_pointCounter_InBUS >= 8'b01000000) 
							STATE_Signal = STATE_NIVEL_3;
						else if (SC_STATEMACHINE_GENERAL_pointCounter_InBUS >= 8'b00100000)
							STATE_Signal = STATE_NIVEL_2;
						else if (SC_STATEMACHINE_GENERAL_speedComparator_InLow == 1'b0)
							STATE_Signal = STATE_sumarCarros_0;
						else 
							STATE_Signal = STATE_esperar_1;
		STATE_FIN:
			STATE_Signal = STATE_FIN;


		//TODO
		default : STATE_Signal = STATE_esperar_0;
	endcase
end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINE_GENERAL_CLOCK_50 , posedge SC_STATEMACHINE_GENERAL_RESET_InHigh)
begin
	if (SC_STATEMACHINE_GENERAL_RESET_InHigh == 1'b1)
		STATE_Register <= STATE_RESET_0;
	else
		STATE_Register <= STATE_Signal;
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
always @ (*)
begin
	case (STATE_Register)
//=========================================================
// STATE_RESET
//=========================================================
	STATE_RESET_0 :	
		begin
			//todo
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b0;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1111111111111111111111111111;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b1;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0000;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b1;
		end
//=========================================================
// STATE_START
//=========================================================
	STATE_START_0 :	
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1111111111111111111111111111;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow		= 1'b1;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS					= 4'b0000;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS					= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow				= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 				= 1'b0;
		end
//=========================================================
// STATE_GO
//=========================================================
	STATE_GO_0 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b1;
			//SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1000111100001101000110000000;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'd50000;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow		= 1'b0;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS					= 4'b0001;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS					= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow				= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 				= 1'b0;
		end
//=========================================================
// STATE_esperarGO
//=========================================================
	STATE_esperarGO_0 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b0;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b0;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1111111111111111111111111111;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b1;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0001;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b1;
		end
//=========================================================
// STATE_NIVEL_1
//=========================================================
	STATE_NIVEL_1 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b1;
			//SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1000111100001101000110000000;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'd50000;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow		= 1'b0;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS					= 4'b0010;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS					= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow				= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 				= 1'b0;
		end
//=========================================================
// STATE_esperarNIVEL_1
//=========================================================
	STATE_esperarNIVEL_1 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b0;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b0;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1111111111111111111111111111;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b1;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0010;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b1;
		end
//=========================================================
// STATE_setSpeed_n1
//=========================================================
	STATE_setSpeed_n1 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b0;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b1;
			//SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b0010111110101111000010000000;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'd50000;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b0;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0010;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b0;
		end
//=========================================================
// STATE_NIVEL_2
//=========================================================
	STATE_NIVEL_2 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b1;
			//SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1000111100001101000110000000;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'd50000;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b0;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0011;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b0;
		end
//=========================================================
// STATE_esperarNIVEL_2
//=========================================================
	STATE_esperarNIVEL_2 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b0;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b0;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1111111111111111111111111111;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b1;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0011;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b1;
		end
//=========================================================
// STATE_setSpeed_n2
//=========================================================
	STATE_setSpeed_n2 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b0;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b0001011111010111100001000000;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b0;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0011;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b0;
		end
//=========================================================
// STATE_NIVEL_3
//=========================================================
	STATE_NIVEL_3 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1000111100001101000110000000;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b0;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0100;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b0;
		end
//=========================================================
// STATE_esperarNIVEL_3
//=========================================================
	STATE_esperarNIVEL_3 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b0;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b0;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1111111111111111111111111111;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b1;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0100;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b1;
		end
//=========================================================
// STATE_setSpeed_n3
//=========================================================
	STATE_setSpeed_n3 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b0;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b0000111001001110000111000000;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b0;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0100;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b0;
		end
//=========================================================
// STATE_lose_jug1
//=========================================================
	STATE_lose_jug1 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1000111100001101000110000000;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b0;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0110;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b0;
		end
//=========================================================
// STATE_esperarLose_jug1
//=========================================================
	STATE_esperarLose_jug1 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b0;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b0;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1111111111111111111111111111;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b1;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0110;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b1;
		end
//=========================================================
// STATE_lose_jug2
//=========================================================
	STATE_lose_jug2 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1000111100001101000110000000;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b0;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0101;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b0;
		end
//=========================================================
// STATE_esperarLose_jug2
//=========================================================
	STATE_esperarLose_jug2 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b0;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b0;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1111111111111111111111111111;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b1;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0101;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b1;
		end
//=========================================================
// STATE_fin
//=========================================================
	STATE_FIN :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1000111100001101000110000000;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b0;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0111;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b0;
		end
//=========================================================
// STATE_sumarCarros
//=========================================================
	STATE_sumarCarros_0 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1111111111111111111111111111;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b1;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b0; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b1001;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b1;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b0;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b0;
		end
//=========================================================
// STATE_moverCarros
//=========================================================
	STATE_moverCarros_0 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1111111111111111111111111111;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b1;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b0; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b1000;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b1;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b0;
		end
//=========================================================
// STATE_esperar_0
//=========================================================
	STATE_esperar_0 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b0;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b0;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1111111111111111111111111111;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b1;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b1000;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b1;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b1;
		end
//=========================================================
// STATE_esperar_1
//=========================================================
	STATE_esperar_1 :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b0;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b0;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1111111111111111111111111111;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b1;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 4'b0111;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b1;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b1;
		end
//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
			SC_STATEMACHINE_GENERAL_clear_OutLow		 	= 1'b0;
			SC_STATEMACHINE_GENERAL_speedCounter_OutLow 	= 1'b1;
			SC_STATEMACHINE_GENERAL_speedReset_OutHigh 		= 1'b1;
			SC_STATEMACHINE_GENERAL_speedComparator_OutBUS 	= 28'b1111111111111111111111111111;
			SC_STATEMACHINE_GENERAL_speedCompLoad_OutLow	= 1'b1;
			SC_STATEMACHINE_GENERAL_pointSignal_OutLow 		= 1'b1; 
			SC_STATEMACHINE_GENERAL_mux0_OutBUS				= 5'b00000;
			SC_STATEMACHINE_GENERAL_mux8_OutBUS				= 1'b0;
			SC_STATEMACHINE_GENERAL_random_OutLow			= 1'b1;
			SC_STATEMACHINE_GENERAL_load0_OutLow 			= 1'b1;
		end
	endcase
	
end

//assign SC_STATEMACHINE_GENERAL_STATE_OutBUS = STATE_Register;

endmodule
