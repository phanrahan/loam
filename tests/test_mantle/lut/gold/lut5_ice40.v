module main (input [4:0] J1, output  J3);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
SB_LUT4 #(.LUT_INIT(16'hAAAA)) inst0 (.I0(J1[0]), .I1(J1[1]), .I2(J1[2]), .I3(J1[3]), .O(inst0_O));
SB_LUT4 #(.LUT_INIT(16'hAAAA)) inst1 (.I0(J1[0]), .I1(J1[1]), .I2(J1[2]), .I3(J1[3]), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst2 (.I0(inst0_O), .I1(inst1_O), .I2(J1[4]), .I3(1'b0), .O(inst2_O));
assign J3 = inst2_O;
endmodule

