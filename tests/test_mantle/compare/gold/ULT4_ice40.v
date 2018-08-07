module Invert4 (input [3:0] I, output [3:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
SB_LUT4 #(.LUT_INIT(16'h5555)) inst0 (.I0(I[0]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst0_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst1 (.I0(I[1]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst2 (.I0(I[2]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst2_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst3 (.I0(I[3]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst3_O));
assign O = {inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module FullAdder (input  I0, input  I1, input  CIN, output  O, output  COUT);
wire  inst0_O;
wire  inst1_CO;
SB_LUT4 #(.LUT_INIT(16'h9696)) inst0 (.I0(I0), .I1(I1), .I2(CIN), .I3(1'b0), .O(inst0_O));
SB_CARRY inst1 (.I0(I0), .I1(I1), .CI(CIN), .CO(inst1_CO));
assign O = inst0_O;
assign COUT = inst1_CO;
endmodule

module Add4_CIN_COUT (input [3:0] I0, input [3:0] I1, input  CIN, output [3:0] O, output  COUT);
wire  inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst1_COUT;
wire  inst2_O;
wire  inst2_COUT;
wire  inst3_O;
wire  inst3_COUT;
FullAdder inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(CIN), .O(inst0_O), .COUT(inst0_COUT));
FullAdder inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(inst0_COUT), .O(inst1_O), .COUT(inst1_COUT));
FullAdder inst2 (.I0(I0[2]), .I1(I1[2]), .CIN(inst1_COUT), .O(inst2_O), .COUT(inst2_COUT));
FullAdder inst3 (.I0(I0[3]), .I1(I1[3]), .CIN(inst2_COUT), .O(inst3_O), .COUT(inst3_COUT));
assign O = {inst3_O,inst2_O,inst1_O,inst0_O};
assign COUT = inst3_COUT;
endmodule

module Sub4_COUT (input [3:0] I0, input [3:0] I1, output [3:0] O, output  COUT);
wire [3:0] inst0_O;
wire [3:0] inst1_O;
wire  inst1_COUT;
Invert4 inst0 (.I(I1), .O(inst0_O));
Add4_CIN_COUT inst1 (.I0(I0), .I1(inst0_O), .CIN(1'b1), .O(inst1_O), .COUT(inst1_COUT));
assign O = inst1_O;
assign COUT = inst1_COUT;
endmodule

module ULT4 (input [3:0] I0, input [3:0] I1, output  O);
wire [3:0] inst0_O;
wire  inst0_COUT;
wire  inst1_O;
Sub4_COUT inst0 (.I0(I0), .I1(I1), .O(inst0_O), .COUT(inst0_COUT));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst1 (.I0(inst0_COUT), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst1_O));
assign O = inst1_O;
endmodule

module main (input [7:0] J1, output  J3);
wire  inst0_O;
ULT4 inst0 (.I0({J1[3],J1[2],J1[1],J1[0]}), .I1({J1[7],J1[6],J1[5],J1[4]}), .O(inst0_O));
assign J3 = inst0_O;
endmodule

