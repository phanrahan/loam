module Ring1_0001 (output [0:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_O;
wire  inst2_O;
SB_DFF inst0 (.C(CLK), .D(inst1_O), .Q(inst0_Q));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst1 (.I0(inst2_O), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst2 (.I0(inst0_Q), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst2_O));
assign O = {inst2_O};
endmodule

module main (output  J3, input  CLKIN);
wire [0:0] inst0_O;
Ring1_0001 inst0 (.O(inst0_O), .CLK(CLKIN));
assign J3 = inst0_O[0];
endmodule

