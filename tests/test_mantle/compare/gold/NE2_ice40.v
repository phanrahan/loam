module NE2 (input [1:0] I0, input [1:0] I1, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'h6FF6)) inst0 (.I0(I0[0]), .I1(I1[0]), .I2(I0[1]), .I3(I1[1]), .O(inst0_O));
assign O = inst0_O;
endmodule

module main (input [3:0] J1, output  J3);
wire  inst0_O;
NE2 inst0 (.I0({J1[1],J1[0]}), .I1({J1[3],J1[2]}), .O(inst0_O));
assign J3 = inst0_O;
endmodule

