module main (input [6:0] SWITCH, output  LED);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
wire  inst8_O;
wire  inst9_O;
wire  inst10_O;
wire  inst11_O;
wire  inst12_O;
wire  inst13_O;
wire  inst14_O;
LUT4 #(.INIT(16'hAAAA)) inst0 (.I0(SWITCH[0]), .I1(SWITCH[1]), .I2(SWITCH[2]), .I3(SWITCH[3]), .O(inst0_O));
LUT4 #(.INIT(16'hAAAA)) inst1 (.I0(SWITCH[0]), .I1(SWITCH[1]), .I2(SWITCH[2]), .I3(SWITCH[3]), .O(inst1_O));
MUXF5 inst2 (.I0(inst0_O), .I1(inst1_O), .S(SWITCH[4]), .O(inst2_O));
LUT4 #(.INIT(16'hAAAA)) inst3 (.I0(SWITCH[0]), .I1(SWITCH[1]), .I2(SWITCH[2]), .I3(SWITCH[3]), .O(inst3_O));
LUT4 #(.INIT(16'hAAAA)) inst4 (.I0(SWITCH[0]), .I1(SWITCH[1]), .I2(SWITCH[2]), .I3(SWITCH[3]), .O(inst4_O));
MUXF5 inst5 (.I0(inst3_O), .I1(inst4_O), .S(SWITCH[4]), .O(inst5_O));
MUXF6 inst6 (.I0(inst2_O), .I1(inst5_O), .S(SWITCH[5]), .O(inst6_O));
LUT4 #(.INIT(16'hAAAA)) inst7 (.I0(SWITCH[0]), .I1(SWITCH[1]), .I2(SWITCH[2]), .I3(SWITCH[3]), .O(inst7_O));
LUT4 #(.INIT(16'hAAAA)) inst8 (.I0(SWITCH[0]), .I1(SWITCH[1]), .I2(SWITCH[2]), .I3(SWITCH[3]), .O(inst8_O));
MUXF5 inst9 (.I0(inst7_O), .I1(inst8_O), .S(SWITCH[4]), .O(inst9_O));
LUT4 #(.INIT(16'hAAAA)) inst10 (.I0(SWITCH[0]), .I1(SWITCH[1]), .I2(SWITCH[2]), .I3(SWITCH[3]), .O(inst10_O));
LUT4 #(.INIT(16'hAAAA)) inst11 (.I0(SWITCH[0]), .I1(SWITCH[1]), .I2(SWITCH[2]), .I3(SWITCH[3]), .O(inst11_O));
MUXF5 inst12 (.I0(inst10_O), .I1(inst11_O), .S(SWITCH[4]), .O(inst12_O));
MUXF6 inst13 (.I0(inst9_O), .I1(inst12_O), .S(SWITCH[5]), .O(inst13_O));
MUXF7 inst14 (.I0(inst6_O), .I1(inst13_O), .S(SWITCH[6]), .O(inst14_O));
assign LED = inst14_O;
endmodule

