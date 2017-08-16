module FullAdder (input  I0, input  I1, input  CIN, output  O, output  COUT);
wire  inst0_O;
wire  inst1_CO;
SB_LUT4 #(.LUT_INIT(16'h9696)) inst0 (.I0(I0), .I1(I1), .I2(CIN), .I3(1'b0), .O(inst0_O));
SB_CARRY inst1 (.I0(I0), .I1(I1), .CI(CIN), .CO(inst1_CO));
assign O = inst0_O;
assign COUT = inst1_CO;
endmodule

module Addcincout2 (input [1:0] I0, input [1:0] I1, input  CIN, output [1:0] O, output  COUT);
wire  inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst1_COUT;
FullAdder inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(CIN), .O(inst0_O), .COUT(inst0_COUT));
FullAdder inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(inst0_COUT), .O(inst1_O), .COUT(inst1_COUT));
assign O = {inst1_O,inst0_O};
assign COUT = inst1_COUT;
endmodule

module main (input  A0, input  A1, input  B0, input  B1, input  CIN, output  D3, output  D2, output  D1, input  CLKIN);
wire [1:0] inst0_O;
wire  inst0_COUT;
Addcincout2 inst0 (.I0({A1,A0}), .I1({B1,B0}), .CIN(CIN), .O(inst0_O), .COUT(inst0_COUT));
assign D3 = inst0_COUT;
assign D2 = inst0_O[1];
assign D1 = inst0_O[0];
endmodule

