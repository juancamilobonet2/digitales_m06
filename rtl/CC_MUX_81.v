module CC_MUX16X1 (
//////////// OUTPUTS //////////
	CC_MUX16X1_z_Out,
//////////// INPUTS //////////
	CC_MUX16X1_select_InBUS,
	CC_MUX16X1_data1_InBUS,
	CC_MUX16X1_data2_InBUS,
	CC_MUX16X1_data3_InBUS,
	CC_MUX16X1_data4_InBUS,
	CC_MUX16X1_data5_InBUS,
	CC_MUX16X1_data6_InBUS,
	CC_MUX16X1_data7_InBUS,
	CC_MUX16X1_data8_InBUS,
   CC_MUX16X1_data9_InBUS,
   CC_MUX16X1_data10_InBUS,
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter NUMBER_DATAWIDTH = 8;
//=======================================================
//  PORT declarations
//=======================================================
output reg [NUMBER_DATAWIDTH-1:0] CC_MUX16X1_z_Out;
input 	[NUMBER_DATAWIDTH-1:0] CC_MUX16X1_data1_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_MUX16X1_data2_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_MUX16X1_data3_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_MUX16X1_data4_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_MUX16X1_data5_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_MUX16X1_data6_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_MUX16X1_data7_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_MUX16X1_data8_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_MUX16X1_data9_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] CC_MUX16X1_data10_InBUS;
input 	[3:0] CC_MUX16X1_select_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=====================================
always @(*)
begin
   if( CC_MUX16X1_select_InBUS == 4'b0000)
      CC_MUX16X1_z_Out = CC_MUX16X1_data1_InBUS;
   else if( CC_MUX16X1_select_InBUS == 4'b0001)
      CC_MUX16X1_z_Out = CC_MUX16X1_data2_InBUS;
   else if( CC_MUX16X1_select_InBUS == 4'b0010)
      CC_MUX16X1_z_Out = CC_MUX16X1_data3_InBUS;
	else if( CC_MUX16X1_select_InBUS == 4'b0011)
      CC_MUX16X1_z_Out = CC_MUX16X1_data4_InBUS;
   else if( CC_MUX16X1_select_InBUS == 4'b0100)
      CC_MUX16X1_z_Out = CC_MUX16X1_data5_InBUS;
   else if( CC_MUX16X1_select_InBUS == 4'b0101)
      CC_MUX16X1_z_Out = CC_MUX16X1_data6_InBUS;
   else if( CC_MUX16X1_select_InBUS == 4'b0110)
      CC_MUX16X1_z_Out = CC_MUX16X1_data7_InBUS;
	else if( CC_MUX16X1_select_InBUS == 4'b0111) 
      CC_MUX16X1_z_Out = CC_MUX16X1_data8_InBUS;
   else if( CC_MUX16X1_select_InBUS == 4'b1000)
      CC_MUX16X1_z_Out = CC_MUX16X1_data9_InBUS;
   else 
      CC_MUX16X1_z_Out = CC_MUX16X1_data10_InBUS;
end

endmodule