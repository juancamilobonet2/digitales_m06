module SC_MUX21 (
//////////// OUTPUTS //////////
	SC_MUX21_z_Out,
//////////// INPUTS //////////
	SC_MUX21_select_InBUS,
	SC_MUX21_data1_InBUS,
	SC_MUX21_data2_InBUS,
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter NUMBER_DATAWIDTH = 8;
//=======================================================
//  PORT declarations
//=======================================================
output reg [NUMBER_DATAWIDTH-1:0] SC_MUX21_z_Out;
input 	[NUMBER_DATAWIDTH-1:0] SC_MUX21_data1_InBUS;
input 	[NUMBER_DATAWIDTH-1:0] SC_MUX21_data2_InBUS;
input 	[0] SC_MUX21_select_InBUS;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=====================================
always @(*)
begin
   if(SC_MUX21_select_InBUS == 1'b0)
      SC_MUX21_z_Out = SC_MUX21_data1_InBUS;
   else
      SC_MUX21_z_Out = SC_MUX21_data2_InBUS;

end

endmodule