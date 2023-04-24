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
module SC_RANDOM #(parameter RegSHIFTER_DATAWIDTH=8)(
	//////////// OUTPUTS //////////
	SC_RANDOM_data_OutBUS,
	//////////// INPUTS //////////
	SC_RANDOM_CLOCK_50,
	SC_RANDOM_RESET_InHigh
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[RegSHIFTER_DATAWIDTH-1:0]	SC_RANDOM_data_OutBUS;
input		SC_RANDOM_CLOCK_50;
input		SC_RANDOM_RESET_InHigh;
//input		[RegSHIFTER_DATAWIDTH-1:0]	SC_RANDOM_data_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [RegSHIFTER_DATAWIDTH-1:0] RegSHIFTER_Register;
reg [RegSHIFTER_DATAWIDTH-1:0] RegSHIFTER_Signal;
reg RegSHIFTER_XorResult;
//=======================================================
//  Structural coding
//=======================================================


//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	//xor
	RegSHIFTER_XorResult = RegSHIFTER_Register[7] ^ RegSHIFTER_Register[4];
	
	RegSHIFTER_Signal = {RegSHIFTER_Register[RegSHIFTER_DATAWIDTH-2:0], RegSHIFTER_XorResult};
	
end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_RANDOM_CLOCK_50, posedge SC_RANDOM_RESET_InHigh)
begin
	if (SC_RANDOM_RESET_InHigh == 1'b1)
		RegSHIFTER_Register <= 8'b00000001;
	else
		if ((RegSHIFTER_Signal[RegSHIFTER_DATAWIDTH-1:4] == 4'b1111) || (RegSHIFTER_Signal[3:0] == 4'b1111))
			RegSHIFTER_Register <= 8'b10111101;
		else
			RegSHIFTER_Register <= RegSHIFTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_RANDOM_data_OutBUS = RegSHIFTER_Register;

endmodule
