module Johnson6 (output [5:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_O;
SB_DFF inst0 (.C(CLK), .D(inst6_O), .Q(inst0_Q));
SB_DFF inst1 (.C(CLK), .D(inst0_Q), .Q(inst1_Q));
SB_DFF inst2 (.C(CLK), .D(inst1_Q), .Q(inst2_Q));
SB_DFF inst3 (.C(CLK), .D(inst2_Q), .Q(inst3_Q));
SB_DFF inst4 (.C(CLK), .D(inst3_Q), .Q(inst4_Q));
SB_DFF inst5 (.C(CLK), .D(inst4_Q), .Q(inst5_Q));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst6 (.I0(inst5_Q), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst6_O));
assign O = {inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module main (output [5:0] J3, input  CLKIN);
wire [5:0] inst0_O;
Johnson6 inst0 (.O(inst0_O), .CLK(CLKIN));
assign J3 = inst0_O;
endmodule

