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
module SC_RegJUG #(parameter RegJUG_DATAWIDTH=8, parameter DATA_FIXED_INITREGPOINT=8'b00000000)(
	//////////// OUTPUTS //////////
	SC_RegJUG_data_OutBUS,
	
	//////////// INPUTS //////////
	SC_RegJUG_CLOCK_50,
	SC_RegJUG_RESET_InHigh,
	SC_RegJUG_clear_InLow, 
	SC_RegJUG_load0_InLow, 
	SC_RegJUG_load1_InLow, 
	SC_RegJUG_shiftselection_In,
	SC_RegJUG_data0_InBUS,
	SC_RegJUG_data1_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[RegJUG_DATAWIDTH-1:0]	SC_RegJUG_data_OutBUS;
input		SC_RegJUG_CLOCK_50;
input		SC_RegJUG_RESET_InHigh;
input		SC_RegJUG_clear_InLow;
input		SC_RegJUG_load0_InLow;	
input		SC_RegJUG_load1_InLow;	
input		[1:0] SC_RegJUG_shiftselection_In;
input		[RegJUG_DATAWIDTH-1:0]	SC_RegJUG_data0_InBUS;
input		[RegJUG_DATAWIDTH-1:0]	SC_RegJUG_data1_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [RegJUG_DATAWIDTH-1:0] RegJUG_Register;
reg [RegJUG_DATAWIDTH-1:0] RegJUG_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_RegJUG_clear_InLow == 1'b0)
		RegJUG_Signal = DATA_FIXED_INITREGPOINT;
	else if (SC_RegJUG_load0_InLow == 1'b0)
		RegJUG_Signal = SC_RegJUG_data0_InBUS;
	else if (SC_RegJUG_load1_InLow == 1'b0)
		RegJUG_Signal = SC_RegJUG_data1_InBUS;
	else if (SC_RegJUG_shiftselection_In == 2'b01)
		RegJUG_Signal = {RegJUG_Register[RegJUG_DATAWIDTH-2:0],RegJUG_Register[RegJUG_DATAWIDTH-1]};
	else if (SC_RegJUG_shiftselection_In == 2'b10)
		RegJUG_Signal = {RegJUG_Register[0],RegJUG_Register[RegJUG_DATAWIDTH-1:1]};
	else
		RegJUG_Signal = RegJUG_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_RegJUG_CLOCK_50, posedge SC_RegJUG_RESET_InHigh)
begin
	if (SC_RegJUG_RESET_InHigh == 1'b1)
		RegJUG_Register <= 0;
	else
		RegJUG_Register <= RegJUG_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_RegJUG_data_OutBUS = RegJUG_Register;

endmodule