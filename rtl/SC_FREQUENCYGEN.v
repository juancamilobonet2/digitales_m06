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
module SC_SPEEDCOUNTER #(parameter SPEEDCOUNTER_DATAWIDTH=28, parameter FREQUENCY = 440)(
	//////////// OUTPUTS //////////
	SC_SPEEDCOUNTER_signal_OutHigh,
	//////////// INPUTS //////////
	SC_SPEEDCOUNTER_CLOCK_50
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output 		SC_SPEEDCOUNTER_signal_OutHigh;
input		SC_SPEEDCOUNTER_CLOCK_50;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [upSPEEDCOUNTER_DATAWIDTH-1:0] SPEEDCOUNTER_Register;
reg [upSPEEDCOUNTER_DATAWIDTH-1:0] SPEEDCOUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_SPEEDCOUNTER_CLOCK_50) 
begin
	SPEEDCOUNTER_Register <= SPEEDCOUNTER_Register + 1'b1;

end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_SPEEDCOUNTER_data_OutBUS = SPEEDCOUNTER_Register;

endmodule
