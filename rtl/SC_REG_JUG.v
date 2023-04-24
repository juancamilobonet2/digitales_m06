module SC_RegJUG #(parameter RegJUG_DATAWIDTH=8, parameter DATA_FIXED_INITREGJUG=8'b00000000)(
	//////////// OUTPUTS //////////
	SC_RegJUG_data_OutBUS,
	//////////// INPUTS //////////
	SC_RegJUG_CLOCK_50,
	SC_RegJUG_RESET_InHigh,
	SC_RegJUG_clear_InLow, 
	SC_RegJUG_load_InLow, 
	SC_RegJUG_data_InBUS
);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[RegJUG_DATAWIDTH-1:0]	SC_RegJUG_data_OutBUS;
input		SC_RegJUG_CLOCK_50;
input		SC_RegJUG_RESET_InHigh;
input		SC_RegJUG_clear_InLow;
input		SC_RegJUG_load_InLow;	
input		[1:0] SC_RegJUG_shiftselection_In;
input		[RegJUG_DATAWIDTH-1:0]	SC_RegJUG_data_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [RegJUG_DATAWIDTH-1:0] RegJUG_Register;
reg [RegJUG_DATAWIDTH-1:0] RegJUG_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_RegJUG_clear_InLow == 1'b0)
		RegJUG_Signal = DATA_FIXED_INITREGJUG;
	// Recibe la pos_inicial del jugador desde su máquina de estados
	else if (SC_RegJUG_load_InLow == 1'b0)
		RegJUG_Signal = SC_RegJUG_data_InBUS;
	// Moverlo hacia la izquierda
	else if (SC_RegJUG_shiftselection_In == 2'b01)
		RegJUG_Signal = {RegJUG_Register[Reg_JUG_DATAWIDTH-2:0],Reg_JUG_Register[Reg_JUG_DATAWIDTH-1]};
	// Moverlo hacia la derecha
	else if (SC_RegJUG_shiftselection_In == 2'b10)
		RegJUG_Signal = {RegJUG_Register[0],RegJUG_Register[Reg_JUG_DATAWIDTH-1:1]};
	else
		RegJUG_Signal = RegJUG_Register;

always @(posedge SC_RegJUG_CLOCK_50, posedge SC_RegJUG_RESET_InHigh)
begin
	if (SC_RegJUG_RESET_InHigh == 1'b1)
		RegJUG_Register <= 0;
	else
		RegJUG_Register <= RegJUG_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_RegJUG_data_OutBUS = RegJUG_Register;

endmodule


