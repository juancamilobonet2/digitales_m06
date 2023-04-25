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
module CC_PosCOMPARATOR_JUG1 #(parameter PosCOMPARATOR_DATAWIDTH=8)(
//////////// OUTPUTS //////////
	CC_PosCOMPARATOR_JUG1_OutBUS,
//////////// INPUTS //////////
	CC_PosCOMPARATOR_JUG1_fila0,
	CC_PosCOMPARATOR_JUG1_posjug1
	
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	reg 	CC_PosCOMPARATOR_JUG1_fila0_Out;
output	reg 	CC_PosCOMPARATOR_JUG1_posjug1_Out;

input 	[PosCOMPARATOR_JUG1_DATAWIDTH-1:0] CC_PosCOMPARATOR_JUG1_fila0;
input 	[PosCOMPARATOR_JUG1_DATAWIDTH-1:0] CC_PosCOMPARATOR_JUG1_posjug1;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
always @(CC_PosCOMPARATOR_JUG1_fila0, CC_PosCOMPARATOR_JUG1_posjug1)
begin
	if( CC_PosCOMPARATOR_JUG1_fila0 == CC_PosCOMPARATOR_JUG1_posjug1)
		CC_PosCOMPARATOR_JUG1_OutBUS = 1'b1;
	else 
		CC_PosCOMPARATOR_JUG1_OutBUS = 1'b0;

	
end

endmodule