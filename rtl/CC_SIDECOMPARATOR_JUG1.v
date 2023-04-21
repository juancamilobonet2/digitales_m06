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
module CC_SIDECOMPARATOR_JUG1 #(parameter SIDECOMPARATOR_DATAWIDTH=8)(
//////////// OUTPUTS //////////
	CC_SIDECOMPARATOR_JUG1_derecha_OutLow,
	CC_SIDECOMPARATOR_JUG1_izquierda_OutLow,
//////////// INPUTS //////////
	CC_SIDECOMPARATOR_JUG1_data_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg CC_SIDECOMPARATOR_JUG1_derecha_OutLow;
output	reg CC_SIDECOMPARATOR_JUG1_izquierda_OutLow;
input 	[SIDECOMPARATOR_JUG_DATAWIDTH-1:0] CC_SIDECOMPARATOR_JUG1_data_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
always @(CC_SIDECOMPARATOR_JUG1_data_InBUS)
begin
	if( CC_SIDECOMPARATOR_JUG1_data_InBUS == 8'b10000000)
		CC_SIDECOMPARATOR_JUG1_izquierda_OutLow = 1'b0;
	else 
		CC_SIDECOMPARATOR_JUG1_izquierda_OutLow = 1'b1;

	if( CC_SIDECOMPARATOR_JUG1_data_InBUS == 8'b00010000)
		CC_SIDECOMPARATOR_JUG1_derecha_OutLow = 1'b0;
	else 
		CC_SIDECOMPARATOR_JUG1_derecha_OutLow = 1'b1;

	
end

endmodule