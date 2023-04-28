module SC_Reg_MATRIX0 #(parameter Reg_MATRIX0_DATAWIDTH=8, parameter DATA_FIXED_INITREGMATRIX=8'b00000000)(
	//////////// OUTPUTS //////////
	SC_MATRIX0_OR1_OutBUS,
    SC_MATRIX0_OR2_OutBUS,
    SC_MATRIX0_COMPARATOR1_OutBUS,
    SC_MATRIX0_COMPARATOR2_OutBUS,
    SC_MATRIX0_MUX21_OutBUS,

	//////////// INPUTS //////////
	SC_MATRIX0_CLOCK_50,
	SC_MATRIX0_RESET_InHigh,
	SC_MATRIX0_clear_InLow, 
	SC_MATRIX0_load0_InLow, 
	SC_MATRIX0_data0_InBUS,
    
);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output		[Reg_MATRIX0_DATAWIDTH-1:0]	SC_MATRIX0_OR1_OutBUS;
output		[Reg_MATRIX0_DATAWIDTH-1:0]	SC_MATRIX0_OR2_OutBUS;
output		[Reg_MATRIX0_DATAWIDTH-1:0]	SC_MATRIX0_COMPARATOR1_OutBUS;
output		[Reg_MATRIX0_DATAWIDTH-1:0]	SC_MATRIX0_COMPARATOR2_OutBUS;
output		[Reg_MATRIX0_DATAWIDTH-1:0]	SC_MATRIX0_MUX21_OutBUS;

input		SC_MATRIX0_CLOCK_50;
input		SC_MATRIX0_RESET_InHigh;
input		SC_MATRIX0_clear_InLow;
input		SC_MATRIX0_load0_InLow;	
input		[Reg_MATRIX0_DATAWIDTH-1:0]	SC_MATRIX0_data0_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [Reg_MATRIX0_DATAWIDTH-1:0] MATRIX0_Register;
reg [Reg_MATRIX0_DATAWIDTH-1:0] MATRIX0_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_MATRIX0_clear_InLow == 1'b0)
		MATRIX0_Signal = DATA_FIXED_INITREGMATRIX;
	else if (SC_MATRIX0_load0_InLow == 1'b0)
		MATRIX0_Signal = SC_MATRIX0_data0_InBUS;
	else
		MATRIX0_Signal = MATRIX0_Register;
	end
always @(posedge SC_MATRIX0_CLOCK_50, posedge SC_MATRIX0_RESET_InHigh)
begin
	if (SC_MATRIX0_RESET_InHigh == 1'b1)
		MATRIX0_Register <= 0;
	else
		MATRIX0_Register <= MATRIX0_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_MATRIX0_OR1_OutBUS = MATRIX0_Register;
assign SC_MATRIX0_OR2_OutBUS = MATRIX0_Register;
assign SC_MATRIX0_COMPARATOR1_OutBUS = MATRIX0_Register;
assign SC_MATRIX0_COMPARATOR2_OutBUS = MATRIX0_Register;
assign SC_MATRIX0_MUX21_OutBUS = MATRIX0_Register;

endmodule