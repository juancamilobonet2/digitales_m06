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
module SC_SPEEDCOUNTER #(parameter SPEEDCOUNTER_DATAWIDTH=28)(
	//////////// OUTPUTS //////////
	SC_SPEEDCOUNTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_SPEEDCOUNTER_CLOCK_50,
	SC_SPEEDCOUNTER_RESET_InHigh,
	SC_SPEEDCOUNTER_upcount_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[SPEEDCOUNTER_DATAWIDTH-1:0]	SC_SPEEDCOUNTER_data_OutBUS;
input		SC_SPEEDCOUNTER_CLOCK_50;
input		SC_SPEEDCOUNTER_RESET_InHigh;
input		SC_SPEEDCOUNTER_upcount_InLow;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [SPEEDCOUNTER_DATAWIDTH-1:0] SPEEDCOUNTER_Register;
reg [SPEEDCOUNTER_DATAWIDTH-1:0] SPEEDCOUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_SPEEDCOUNTER_upcount_InLow == 1'b0)
		SPEEDCOUNTER_Signal = SPEEDCOUNTER_Register + 1'b1;
	else
		SPEEDCOUNTER_Signal = SPEEDCOUNTER_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_SPEEDCOUNTER_CLOCK_50, posedge SC_SPEEDCOUNTER_RESET_InHigh)
begin
	if (SC_SPEEDCOUNTER_RESET_InHigh  == 1'b1)
		SPEEDCOUNTER_Register <= 0;
	else
		SPEEDCOUNTER_Register <= SPEEDCOUNTER_Signal;

end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_SPEEDCOUNTER_data_OutBUS = SPEEDCOUNTER_Register;

endmodule
