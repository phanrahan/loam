module Or4 (input [3:0] I, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'hFFFE)) inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst0_O));
assign O = inst0_O;
endmodule

module main (input [3:0] J1, output  J3);
wire  inst0_O;
Or4 inst0 (.I(J1), .O(inst0_O));
assign J3 = inst0_O;
endmodule
