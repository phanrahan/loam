module EQ2 (input [1:0] I0, input [1:0] I1, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'h9009)) inst0 (.I0(I0[0]), .I1(I1[0]), .I2(I0[1]), .I3(I1[1]), .O(inst0_O));
assign O = inst0_O;
endmodule

module main (input [1:0] J1, output  D1);
wire  inst0_O;
EQ2 inst0 (.I0(J1), .I1({1'b1,1'b0}), .O(inst0_O));
assign D1 = inst0_O;
endmodule

