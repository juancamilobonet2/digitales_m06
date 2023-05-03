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
module CC_PosCOMPARATOR_JUG2 #(parameter PosCOMPARATOR_DATAWIDTH=8)(
//////////// OUTPUTS //////////
	CC_PosCOMPARATOR_JUG2_OutBUS,
//////////// INPUTS //////////
	CC_PosCOMPARATOR_JUG2_fila0,
	CC_PosCOMPARATOR_JUG2_posjug2
	
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

output	reg 	CC_PosCOMPARATOR_JUG2_OutBUS;
input 	[PosCOMPARATOR_DATAWIDTH-1:0] CC_PosCOMPARATOR_JUG2_fila0;
input 	[PosCOMPARATOR_DATAWIDTH-1:0] CC_PosCOMPARATOR_JUG2_posjug2;
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
always @(CC_PosCOMPARATOR_JUG2_fila0, CC_PosCOMPARATOR_JUG2_posjug2)
begin
	if( CC_PosCOMPARATOR_JUG2_fila0[0] == CC_PosCOMPARATOR_JUG2_posjug2[0])
		CC_PosCOMPARATOR_JUG2_OutBUS = 1'b0;
	else if ( CC_PosCOMPARATOR_JUG2_fila0[1] == CC_PosCOMPARATOR_JUG2_posjug2[1])
		CC_PosCOMPARATOR_JUG2_OutBUS = 1'b0;
	else if ( CC_PosCOMPARATOR_JUG2_fila0[2] == CC_PosCOMPARATOR_JUG2_posjug2[2])
		CC_PosCOMPARATOR_JUG2_OutBUS = 1'b0;
	else if ( CC_PosCOMPARATOR_JUG2_fila0[3] == CC_PosCOMPARATOR_JUG2_posjug2[3])
		CC_PosCOMPARATOR_JUG2_OutBUS = 1'b0;
	else if ( CC_PosCOMPARATOR_JUG2_fila0[4] == CC_PosCOMPARATOR_JUG2_posjug2[4])
		CC_PosCOMPARATOR_JUG2_OutBUS = 1'b0;
	else if ( CC_PosCOMPARATOR_JUG2_fila0[5] == CC_PosCOMPARATOR_JUG2_posjug2[5])
		CC_PosCOMPARATOR_JUG2_OutBUS = 1'b0;
	else if ( CC_PosCOMPARATOR_JUG2_fila0[6] == CC_PosCOMPARATOR_JUG2_posjug2[6])
		CC_PosCOMPARATOR_JUG2_OutBUS = 1'b0;
	else if ( CC_PosCOMPARATOR_JUG2_fila0[7] == CC_PosCOMPARATOR_JUG2_posjug2[7])
		CC_PosCOMPARATOR_JUG2_OutBUS = 1'b0;
	else 
		CC_PosCOMPARATOR_JUG2_OutBUS = 1'b1;

end

endmodule