module SIPO8_0001 (input  I, output [7:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_O;
wire  inst2_O;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_Q;
wire  inst7_Q;
wire  inst8_Q;
wire  inst9_Q;
SB_DFF inst0 (.C(CLK), .D(inst1_O), .Q(inst0_Q));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst1 (.I0(I), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst2 (.I0(inst0_Q), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst2_O));
SB_DFF inst3 (.C(CLK), .D(inst2_O), .Q(inst3_Q));
SB_DFF inst4 (.C(CLK), .D(inst3_Q), .Q(inst4_Q));
SB_DFF inst5 (.C(CLK), .D(inst4_Q), .Q(inst5_Q));
SB_DFF inst6 (.C(CLK), .D(inst5_Q), .Q(inst6_Q));
SB_DFF inst7 (.C(CLK), .D(inst6_Q), .Q(inst7_Q));
SB_DFF inst8 (.C(CLK), .D(inst7_Q), .Q(inst8_Q));
SB_DFF inst9 (.C(CLK), .D(inst8_Q), .Q(inst9_Q));
assign O = {inst9_Q,inst8_Q,inst7_Q,inst6_Q,inst5_Q,inst4_Q,inst3_Q,inst2_O};
endmodule

module XOr4 (input [3:0] I, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'h6996)) inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst0_O));
assign O = inst0_O;
endmodule

module LFSR8_1 (output [7:0] O, input  CLK);
wire [7:0] inst0_O;
wire  inst1_O;
SIPO8_0001 inst0 (.I(inst1_O), .O(inst0_O), .CLK(CLK));
XOr4 inst1 (.I({inst0_O[3],inst0_O[4],inst0_O[5],inst0_O[7]}), .O(inst1_O));
assign O = inst0_O;
endmodule

module main (output [7:0] J3);
wire [7:0] inst0_O;
LFSR8_1 inst0 (.O(inst0_O));
assign J3 = inst0_O;
endmodule

