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
module SC_POINTCOUNTER #(parameter POINTCOUNTER_DATAWIDTH=8)(
	//////////// OUTPUTS //////////
	SC_POINTCOUNTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_POINTCOUNTER_CLOCK_50,
	SC_POINTCOUNTER_RESET_InHigh,
	SC_POINTCOUNTER_upcount_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[POINTCOUNTER_DATAWIDTH-1:0]	SC_POINTCOUNTER_data_OutBUS;
input		SC_POINTCOUNTER_CLOCK_50;
input		SC_POINTCOUNTER_RESET_InHigh;
input		SC_POINTCOUNTER_upcount_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [POINTCOUNTER_DATAWIDTH-1:0] POINTCOUNTER_Register;
reg [POINTCOUNTER_DATAWIDTH-1:0] POINTCOUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_POINTCOUNTER_upcount_InLow == 1'b0)
		POINTCOUNTER_Signal = POINTCOUNTER_Register + 1'b1;
	else
		POINTCOUNTER_Signal = POINTCOUNTER_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_POINTCOUNTER_CLOCK_50, posedge SC_POINTCOUNTER_RESET_InHigh)
begin
	if (SC_POINTCOUNTER_RESET_InHigh  == 1'b1)
		POINTCOUNTER_Register <= 0;
	else
		POINTCOUNTER_Register <= POINTCOUNTER_Signal;

end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_POINTCOUNTER_data_OutBUS = POINTCOUNTER_Register;

endmodule
