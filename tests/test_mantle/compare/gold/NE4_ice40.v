module NE4 (input [3:0] I0, input [3:0] I1, output  O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
SB_LUT4 #(.LUT_INIT(16'hBEBE)) inst0 (.I0(1'b0), .I1(I0[0]), .I2(I1[0]), .I3(1'b0), .O(inst0_O));
SB_LUT4 #(.LUT_INIT(16'hBEBE)) inst1 (.I0(inst0_O), .I1(I0[1]), .I2(I1[1]), .I3(1'b0), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'hBEBE)) inst2 (.I0(inst1_O), .I1(I0[2]), .I2(I1[2]), .I3(1'b0), .O(inst2_O));
SB_LUT4 #(.LUT_INIT(16'hBEBE)) inst3 (.I0(inst2_O), .I1(I0[3]), .I2(I1[3]), .I3(1'b0), .O(inst3_O));
assign O = inst3_O;
endmodule

module main (input [7:0] J1, output  J3);
wire  inst0_O;
NE4 inst0 (.I0({J1[3],J1[2],J1[1],J1[0]}), .I1({J1[7],J1[6],J1[5],J1[4]}), .O(inst0_O));
assign J3 = inst0_O;
endmodule

