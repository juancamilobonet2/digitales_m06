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
module CC_SPEEDCOMPARATOR #(parameter SPEEDCOMPARATOR_DATAWIDTH=28)(
//////////// OUTPUTS //////////
	CC_SPEEDCOMPARATOR_signal_OutLow,
//////////// INPUTS //////////
	CC_SPEEDCOMPARATOR_data_InBUS,
	CC_SPEEDCOMPARATOR_limit_InBUS,
	CC_SPEEDCOMPARATOR_loadSignal_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	CC_SPEEDCOMPARATOR_signal_OutLow;
input 	[SPEEDCOMPARATOR_DATAWIDTH-1:0] CC_SPEEDCOMPARATOR_data_InBUS;
input 	[SPEEDCOMPARATOR_DATAWIDTH-1:0] CC_SPEEDCOMPARATOR_limit_InBUS;
input 	CC_SPEEDCOMPARATOR_loadSignal_InLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [SPEEDCOMPARATOR_DATAWIDTH-1:0] CC_SPEEDCOMPARATOR_limit;
//=======================================================
//  Structural coding
//=======================================================
always @(negedge CC_SPEEDCOMPARATOR_loadSignal_InLow)
begin
	CC_SPEEDCOMPARATOR_limit = CC_SPEEDCOMPARATOR_limit_InBUS;
end


always @(CC_SPEEDCOMPARATOR_data_InBUS)
begin
	if( CC_SPEEDCOMPARATOR_data_InBUS >= CC_SPEEDCOMPARATOR_limit)
		CC_SPEEDCOMPARATOR_signal_OutLow = 1'b0;
	else 
		CC_SPEEDCOMPARATOR_signal_OutLow = 1'b1;
end

endmodule