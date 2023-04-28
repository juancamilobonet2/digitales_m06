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
	SC_MUX81_data8_InBUS,
   SC_MUX81_data9_InBUS,
   SC_MUX81_data10_InBUS,
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
input 	[NUMBER_DATAWIDTH-1:0] SC_MUX81_data9_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] SC_MUX81_data10_InBUS;
input 	[3:0] SC_MUX81_select_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=====================================
always @(*)
begin
   if( SC_MUX81_select_InBUS == 4'b0000)
      SC_MUX81_z_Out = SC_MUX81_data1_InBUS;
   else if( SC_MUX81_select_InBUS == 4'b0001)
      SC_MUX81_z_Out = SC_MUX81_data2_InBUS;
   else if( SC_MUX81_select_InBUS == 4'b0010)
      SC_MUX81_z_Out = SC_MUX81_data3_InBUS;
	else if( SC_MUX81_select_InBUS == 4'b0011)
      SC_MUX81_z_Out = SC_MUX81_data4_InBUS;
   else if( SC_MUX81_select_InBUS == 4'b0100)
      SC_MUX81_z_Out = SC_MUX81_data5_InBUS;
   else if( SC_MUX81_select_InBUS == 4'b0101)
      SC_MUX81_z_Out = SC_MUX81_data6_InBUS;
   else if( SC_MUX81_select_InBUS == 4'b0110)
      SC_MUX81_z_Out = SC_MUX81_data7_InBUS;
	else if( SC_MUX81_select_InBUS == 4'b0111) 
      SC_MUX81_z_Out = SC_MUX81_data8_InBUS;
   else if( SC_MUX81_select_InBUS == 4'b1000)
      SC_MUX81_z_Out = SC_MUX81_data9_InBUS;
   else 
      SC_MUX81_z_Out = SC_MUX81_data10_InBUS;
end

endmodule