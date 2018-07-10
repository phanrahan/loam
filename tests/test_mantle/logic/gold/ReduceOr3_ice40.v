module Or3 (input [2:0] I, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'hFEFE)) inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(1'b0), .O(inst0_O));
assign O = inst0_O;
endmodule

module main (input [2:0] J1, output  J3);
wire  inst0_O;
Or3 inst0 (.I(J1), .O(inst0_O));
assign J3 = inst0_O;
endmodule

