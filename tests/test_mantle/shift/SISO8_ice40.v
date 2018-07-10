module SISO8 (input  I, output  O, input  CLK);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_Q;
wire  inst7_Q;
SB_DFF inst0 (.C(CLK), .D(I), .Q(inst0_Q));
SB_DFF inst1 (.C(CLK), .D(inst0_Q), .Q(inst1_Q));
SB_DFF inst2 (.C(CLK), .D(inst1_Q), .Q(inst2_Q));
SB_DFF inst3 (.C(CLK), .D(inst2_Q), .Q(inst3_Q));
SB_DFF inst4 (.C(CLK), .D(inst3_Q), .Q(inst4_Q));
SB_DFF inst5 (.C(CLK), .D(inst4_Q), .Q(inst5_Q));
SB_DFF inst6 (.C(CLK), .D(inst5_Q), .Q(inst6_Q));
SB_DFF inst7 (.C(CLK), .D(inst6_Q), .Q(inst7_Q));
assign O = inst7_Q;
endmodule

module main (input  J1, output  J3, input  CLKIN);
wire  inst0_O;
SISO8 inst0 (.I(J1), .O(inst0_O), .CLK(CLKIN));
assign J3 = inst0_O;
endmodule

