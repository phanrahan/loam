module FullAdder (input  I0, input  I1, input  CIN, output  O, output  COUT);
wire  inst0_O;
wire  inst1_CO;
SB_LUT4 #(.LUT_INIT(16'h9696)) inst0 (.I0(I0), .I1(I1), .I2(CIN), .I3(1'b0), .O(inst0_O));
SB_CARRY inst1 (.I0(I0), .I1(I1), .CI(CIN), .CO(inst1_CO));
assign O = inst0_O;
assign COUT = inst1_CO;
endmodule

module main (input  A0, input  A1, input  B0, input  B1, output  D3, output  D2, output  D1);
wire  inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst1_COUT;
FullAdder inst0 (.I0(A0), .I1(B0), .CIN(1'b0), .O(inst0_O), .COUT(inst0_COUT));
FullAdder inst1 (.I0(A1), .I1(B1), .CIN(inst0_COUT), .O(inst1_O), .COUT(inst1_COUT));
assign D3 = inst1_COUT;
assign D2 = inst1_O;
assign D1 = inst0_O;
endmodule

