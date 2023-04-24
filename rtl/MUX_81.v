module SC_MUX81 (
//////////// OUTPUTS //////////
	SC_MUX81_z_Out,
//////////// INPUTS //////////
	SC_MUX81_select_InBUS,
	SC_MUX81_data1_InBUS,
	SC_MUX81_data2_InBUS,
	SC_MUX81_data3_InBUS,
	SC_MUX81_data4_InBUS,
	SC_MUX81_data5_InBUS,
	SC_MUX81_data6_InBUS,
	SC_MUX81_data7_InBUS,
	SC_MUX81_data8_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter NUMBER_DATAWIDTH = 8;
//=======================================================
//  PORT declarations
//=======================================================
output reg [NUMBER_DATAWIDTH-1:0] SC_MUX81_z_Out;
input 	[NUMBER_DATAWIDTH-1:0] SC_MUX81_data1_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] SC_MUX81_data2_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] SC_MUX81_data3_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] SC_MUX81_data4_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] SC_MUX81_data5_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] SC_MUX81_data6_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] SC_MUX81_data7_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] SC_MUX81_data8_InBUS;
input 	[2:0] SC_MUX81_select_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=====================================
always @(*)
begin
   if( SC_MUX81_select_InBUS == 3'b000)
      SC_MUX81_z_Out = SC_MUX81_data1_InBUS;
   else if( SC_MUX81_select_InBUS == 3'b001)
      SC_MUX81_z_Out = SC_MUX81_data2_InBUS;
   else if( SC_MUX81_select_InBUS == 3'b010)
      SC_MUX81_z_Out = SC_MUX81_data3_InBUS;
	else if( SC_MUX81_select_InBUS == 3'b011)
      SC_MUX81_z_Out = SC_MUX81_data4_InBUS;
   else if( SC_MUX81_select_InBUS == 3'b100)
      SC_MUX81_z_Out = SC_MUX81_data5_InBUS;
   else if( SC_MUX81_select_InBUS == 3'b101)
      SC_MUX81_z_Out = SC_MUX81_data6_InBUS;
   else if( SC_MUX81_select_InBUS == 3'b110)
      SC_MUX81_z_Out = SC_MUX81_data7_InBUS;
	else 
      SC_MUX81_z_Out = SC_MUX81_data8_InBUS;
end

endmodule