module Add4 (input [3:0] I0, input [3:0] I1, output [3:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
wire  inst8_O;
wire  inst9_O;
wire  inst10_O;
wire  inst11_O;
LUT2 #(.INIT(4'h6)) inst0 (.I0(I0[0]), .I1(I1[0]), .O(inst0_O));
MUXCY inst1 (.DI(I0[0]), .CI(1'b0), .S(inst0_O), .O(inst1_O));
XORCY inst2 (.LI(inst0_O), .CI(1'b0), .O(inst2_O));
LUT2 #(.INIT(4'h6)) inst3 (.I0(I0[1]), .I1(I1[1]), .O(inst3_O));
MUXCY inst4 (.DI(I0[1]), .CI(inst1_O), .S(inst3_O), .O(inst4_O));
XORCY inst5 (.LI(inst3_O), .CI(inst1_O), .O(inst5_O));
LUT2 #(.INIT(4'h6)) inst6 (.I0(I0[2]), .I1(I1[2]), .O(inst6_O));
MUXCY inst7 (.DI(I0[2]), .CI(inst4_O), .S(inst6_O), .O(inst7_O));
XORCY inst8 (.LI(inst6_O), .CI(inst4_O), .O(inst8_O));
LUT2 #(.INIT(4'h6)) inst9 (.I0(I0[3]), .I1(I1[3]), .O(inst9_O));
MUXCY inst10 (.DI(I0[3]), .CI(inst7_O), .S(inst9_O), .O(inst10_O));
XORCY inst11 (.LI(inst9_O), .CI(inst7_O), .O(inst11_O));
assign O = {inst11_O,inst8_O,inst5_O,inst2_O};
endmodule

module Register4R (input [3:0] I, output [3:0] O, input  CLK, input  RESET);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
FDRSE #(.INIT(1'h0)) inst0 (.C(CLK), .CE(1'b1), .S(1'b0), .D(I[0]), .Q(inst0_Q));
FDRSE #(.INIT(1'h0)) inst1 (.C(CLK), .CE(1'b1), .S(1'b0), .D(I[1]), .Q(inst1_Q));
FDRSE #(.INIT(1'h0)) inst2 (.C(CLK), .CE(1'b1), .S(1'b0), .D(I[2]), .Q(inst2_Q));
FDRSE #(.INIT(1'h0)) inst3 (.C(CLK), .CE(1'b1), .S(1'b0), .D(I[3]), .Q(inst3_Q));
assign O = {inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module Counter4R (output [3:0] O, input  CLK, input  RESET);
wire [3:0] inst0_O;
wire [3:0] inst1_O;
Add4 inst0 (.I0(inst1_O), .I1({1'b0,1'b0,1'b0,1'b1}), .O(inst0_O));
Register4R inst1 (.I(inst0_O), .O(inst1_O), .CLK(CLK), .RESET(RESET));
assign O = inst1_O;
endmodule

module Decode4 (input [3:0] I, output  O);
wire  inst0_O;
LUT4 #(.INIT(16'h8000)) inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .O(inst0_O));
assign O = inst0_O;
endmodule

module Counter4_Mod16_COUT (output [3:0] O, output  COUT, input  CLK);
wire [3:0] inst0_O;
wire  inst1_O;
Counter4R inst0 (.O(inst0_O), .CLK(CLK), .RESET(inst1_O));
Decode4 inst1 (.I(inst0_O), .O(inst1_O));
assign O = inst0_O;
assign COUT = inst1_O;
endmodule

module main (output [3:0] LED, input  CLKIN);
wire [3:0] inst0_O;
wire  inst0_COUT;
Counter4_Mod16_COUT inst0 (.O(inst0_O), .COUT(inst0_COUT), .CLK(CLKIN));
assign LED = inst0_O;
endmodule

