module NOr2 (input [1:0] I, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'h1111)) inst0 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(inst0_O));
assign O = inst0_O;
endmodule

module main (input [1:0] J1, output  J3);
wire  inst0_O;
NOr2 inst0 (.I(J1), .O(inst0_O));
assign J3 = inst0_O;
endmodule

