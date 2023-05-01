module CC_OR_C (
// =============== PORT Declaration ===============
    // --------------- OUTPUT ----------------
    CC_OR_C_z_Out,
    // --------------- INPUT ----------------
    CC_OR_C_data0_In,
    CC_OR_C_data1_In
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter NUMBER_DATAWIDTH = 8;
//=======================================================
//  PORT declarations
//=======================================================
output reg [NUMBER_DATAWIDTH-1:0] CC_OR_C_z_Out;
input 	[NUMBER_DATAWIDTH-1:0] CC_OR_C_data0_In;
input 	[NUMBER_DATAWIDTH-1:0] CC_OR_C_data1_In;
//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=====================================
always @(*)
begin
   CC_OR_C_z_Out = CC_OR_C_data0_In | CC_OR_C_data1_In;
end
endmodule
