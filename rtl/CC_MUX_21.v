module CC_MUX_21 (
//////////// OUTPUTS //////////
	CC_MUX_21_z_Out,
//////////// INPUTS //////////
	CC_MUX_21_select_InBUS,
	CC_MUX_21_data1_InBUS,
	CC_MUX_21_data2_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter NUMBER_DATAWIDTH = 8;
//=======================================================
//  PORT declarations
//=======================================================
output reg [NUMBER_DATAWIDTH-1:0] CC_MUX_21_z_Out;
input 	[NUMBER_DATAWIDTH-1:0] CC_MUX_21_data1_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_MUX_21_data2_InBUS;
input 	[NUMBER_DATAWIDTH-7:0] CC_MUX_21_select_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=====================================
always @(*)
begin
   if(CC_MUX_21_select_InBUS == 1'b0)
      CC_MUX_21_z_Out = CC_MUX_21_data1_InBUS;
   else
      CC_MUX_21_z_Out = CC_MUX_21_data2_InBUS;

end

endmodule