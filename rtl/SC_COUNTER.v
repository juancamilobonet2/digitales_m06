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
// Este modulo recibe un valor que corresponde al limite del contador.
// Cuando llega a ese numero de ciclos del reloj, manda una senal de salida.
module SC_COUNTER #(parameter COUNTER_DATAWIDTH=8)(
	//////////// OUTPUTS //////////
	SC_COUNTER_signal_OutLow,
	//////////// INPUTS //////////
	SC_COUNTER_CLOCK_50,
	SC_COUNTER_RESET_InHigh,
	SC_COUNTER_LOAD_InLow,
	SC_COUNTER_data_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output reg		SC_COUNTER_signal_OutLow;
input		SC_COUNTER_CLOCK_50;
input		SC_COUNTER_RESET_InHigh;
input		SC_COUNTER_LOAD_InLow;	
input 		[COUNTER_DATAWIDTH-1:0] SC_COUNTER_data_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [COUNTER_DATAWIDTH-1:0] COUNTER_limit;
reg [COUNTER_DATAWIDTH-1:0] COUNTER_count;
reg [COUNTER_DATAWIDTH-1:0] COUNTER_data_signal;
reg [COUNTER_DATAWIDTH-1:0] COUNTER_count_signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_COUNTER_LOAD_InLow == 1'b0) begin
		COUNTER_data_signal = SC_COUNTER_data_InBUS;
		COUNTER_count_signal = 0;
	end
	else begin
		COUNTER_data_signal = COUNTER_limit;
		COUNTER_count_signal = COUNTER_count;
	end
end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_COUNTER_CLOCK_50, posedge SC_COUNTER_RESET_InHigh)
begin
	if (SC_COUNTER_RESET_InHigh == 1'b1) begin
		COUNTER_limit <= 0;
	end
	else if (COUNTER_limit == 1'b0) begin
		SC_COUNTER_signal_OutLow <= 1'b1;
		COUNTER_limit <= COUNTER_data_signal;
		COUNTER_count <= COUNTER_count_signal;
	end
	else if (COUNTER_count_signal == COUNTER_limit) begin
		SC_COUNTER_signal_OutLow <= 1'b0;
		COUNTER_limit <= COUNTER_data_signal;
		COUNTER_count <= 0;
	end
	else begin
		SC_COUNTER_signal_OutLow <= 1'b1;
		COUNTER_count <= COUNTER_count_signal + 1;
		COUNTER_limit <= COUNTER_data_signal;
	end
end


endmodule
