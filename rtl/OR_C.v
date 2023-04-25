module SC_OR_C (
// =============== PORT Declaration ===============
    // --------------- OUTPUT ----------------
    OR_C_z_Out,
    // --------------- INPUT ----------------
    OR_C_data0_In,
    OR_C_data1_In
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter NUMBER_DATAWIDTH = 8;
//=======================================================
//  PORT declarations
//=======================================================
output reg [NUMBER_DATAWIDTH-1:0] SC_OR_C_z_Out;
input 	[NUMBER_DATAWIDTH-1:0] OR_C_data0_In;
input 	[NUMBER_DATAWIDTH-1:0] OR_C_data1_In;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=====================================
always @(*)
begin
   SC_OR_C_z_Out = OR_C_data0_In | OR_C_data1_In;
end
endmodule
