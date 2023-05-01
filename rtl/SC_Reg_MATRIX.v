module SC_Reg_MATRIX #(parameter Reg_MATRIX_DATAWIDTH=8, parameter DATA_FIXED_INITREGMATRIX=8'b00000000)(
	//////////// OUTPUTS //////////
	SC_Reg_MATRIX_data_OutBUS,
	
	//////////// INPUTS //////////
	SC_Reg_MATRIX_CLOCK_50,
	SC_Reg_MATRIX_RESET_InHigh,
	SC_Reg_MATRIX_clear_InLow, 
	SC_Reg_MATRIX_load0_InLow, 
	//SC_Reg_MATRIX_load1_InLow, 
	//SC_Reg_MATRIX_shiftselection_In,
	SC_Reg_MATRIX_data0_InBUS
    //Este no es necesario pq solo le entran datos del mux
	//SC_Reg_MATRIX_data1_InBUS
);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[Reg_MATRIX_DATAWIDTH-1:0]	SC_Reg_MATRIX_data_OutBUS;
input		SC_Reg_MATRIX_CLOCK_50;
input		SC_Reg_MATRIX_RESET_InHigh;
input		SC_Reg_MATRIX_clear_InLow;
input		SC_Reg_MATRIX_load0_InLow;	
//input		SC_Reg_MATRIX_load1_InLow;	
//input		[1:0] SC_Reg_MATRIX_shiftselection_In;
input		[Reg_MATRIX_DATAWIDTH-1:0]	SC_Reg_MATRIX_data0_InBUS;
//input		[Reg_MATRIX_DATAWIDTH-1:0]	SC_Reg_MATRIX_data1_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [Reg_MATRIX_DATAWIDTH-1:0] Reg_MATRIX_Register;
reg [Reg_MATRIX_DATAWIDTH-1:0] Reg_MATRIX_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_Reg_MATRIX_clear_InLow == 1'b0)
		Reg_MATRIX_Signal = DATA_FIXED_INITREGMATRIX;
	else if (SC_Reg_MATRIX_load0_InLow == 1'b0)
		Reg_MATRIX_Signal = SC_Reg_MATRIX_data0_InBUS;
	else
		Reg_MATRIX_Signal = Reg_MATRIX_Register;
	end
always @(posedge SC_Reg_MATRIX_CLOCK_50, posedge SC_Reg_MATRIX_RESET_InHigh)
begin
	if (SC_Reg_MATRIX_RESET_InHigh == 1'b1)
		Reg_MATRIX_Register <= 0;
	else
		Reg_MATRIX_Register <= Reg_MATRIX_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_Reg_MATRIX_data_OutBUS = Reg_MATRIX_Register;

endmodule