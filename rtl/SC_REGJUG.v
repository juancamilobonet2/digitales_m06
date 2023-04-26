module SC_REGJUG #(parameter REGJUG_DATAWIDTH=8, parameter DATA_FIXED_INITREGJUG=8'b00000000, parameter DATA_INIT_POS=8'b01000100)(
	//////////// OUTPUTS //////////
	SC_REGJUG_data_OutBUS,
	//////////// INPUTS //////////
	SC_REGJUG_CLOCK_50,
	SC_REGJUG_RESET_InHigh,
	SC_REGJUG_clear_InLow
);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[REGJUG_DATAWIDTH-1:0]	SC_REGJUG_data_OutBUS;
input		SC_REGJUG_CLOCK_50;
input		SC_REGJUG_RESET_InHigh;
input		SC_REGJUG_clear_InLow;	
input		[1:0] SC_REGJUG_shiftselection_In;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [REGJUG_DATAWIDTH-1:0] REGJUG_Register;
reg [REGJUG_DATAWIDTH-1:0] REGJUG_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_REGJUG_clear_InLow == 1'b0)
		REGJUG_Signal = DATA_FIXED_INITREGJUG;
	// Pos inicial 
	else if (SC_REGJUG_RESET_InHigh == 1'b0)
		REGJUG_Signal = DATA_INIT_POS;
	// Moverlo hacia la izquierda
	else if (SC_REGJUG_shiftselection_In == 2'b01)
		REGJUG_Signal = {REGJUG_Register[Reg_JUG_DATAWIDTH-2:0],Reg_JUG_Register[Reg_JUG_DATAWIDTH-1]};
	// Moverlo hacia la derecha
	else if (SC_REGJUG_shiftselection_In == 2'b10)
		REGJUG_Signal = {REGJUG_Register[0],REGJUG_Register[Reg_JUG_DATAWIDTH-1:1]};
	else
		REGJUG_Signal = REGJUG_Register;
	end

always @(posedge SC_REGJUG_CLOCK_50, posedge SC_REGJUG_RESET_InHigh)
begin
	if (SC_REGJUG_RESET_InHigh == 1'b1)
		REGJUG_Register <= 0;
	else
		REGJUG_Register <= REGJUG_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_REGJUG_data_OutBUS = REGJUG_Register;

endmodule


