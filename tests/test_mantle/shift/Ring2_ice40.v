module Ring2_0001 (output [1:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_O;
wire  inst2_O;
wire  inst3_Q;
SB_DFF inst0 (.C(CLK), .D(inst1_O), .Q(inst0_Q));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst1 (.I0(inst3_Q), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst2 (.I0(inst0_Q), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst2_O));
SB_DFF inst3 (.C(CLK), .D(inst2_O), .Q(inst3_Q));
assign O = {inst3_Q,inst2_O};
endmodule

module main (output [1:0] J3, input  CLKIN);
wire [1:0] inst0_O;
Ring2_0001 inst0 (.O(inst0_O), .CLK(CLKIN));
assign J3 = inst0_O;
endmodule

