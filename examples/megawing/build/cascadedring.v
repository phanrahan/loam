module Ring9CE_0001 (output [8:0] O, input  CLK, input  CE);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_Q;
wire  inst7_Q;
wire  inst8_Q;
FDRSE #(.INIT(1'h1)) inst0 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst8_Q), .Q(inst0_Q));
FDRSE #(.INIT(1'h0)) inst1 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst0_Q), .Q(inst1_Q));
FDRSE #(.INIT(1'h0)) inst2 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst1_Q), .Q(inst2_Q));
FDRSE #(.INIT(1'h0)) inst3 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst2_Q), .Q(inst3_Q));
FDRSE #(.INIT(1'h0)) inst4 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst3_Q), .Q(inst4_Q));
FDRSE #(.INIT(1'h0)) inst5 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst4_Q), .Q(inst5_Q));
FDRSE #(.INIT(1'h0)) inst6 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst5_Q), .Q(inst6_Q));
FDRSE #(.INIT(1'h0)) inst7 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst6_Q), .Q(inst7_Q));
FDRSE #(.INIT(1'h0)) inst8 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst7_Q), .Q(inst8_Q));
assign O = {inst8_Q,inst7_Q,inst6_Q,inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module And2 (input [1:0] I, output  O);
wire  inst0_O;
LUT2 #(.INIT(4'h8)) inst0 (.I0(I[0]), .I1(I[1]), .O(inst0_O));
assign O = inst0_O;
endmodule

module Ring7CE_0001 (output [6:0] O, input  CLK, input  CE);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_Q;
FDRSE #(.INIT(1'h1)) inst0 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst6_Q), .Q(inst0_Q));
FDRSE #(.INIT(1'h0)) inst1 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst0_Q), .Q(inst1_Q));
FDRSE #(.INIT(1'h0)) inst2 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst1_Q), .Q(inst2_Q));
FDRSE #(.INIT(1'h0)) inst3 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst2_Q), .Q(inst3_Q));
FDRSE #(.INIT(1'h0)) inst4 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst3_Q), .Q(inst4_Q));
FDRSE #(.INIT(1'h0)) inst5 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst4_Q), .Q(inst5_Q));
FDRSE #(.INIT(1'h0)) inst6 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst5_Q), .Q(inst6_Q));
assign O = {inst6_Q,inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module Ring8CE_0001 (output [7:0] O, input  CLK, input  CE);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_Q;
wire  inst7_Q;
FDRSE #(.INIT(1'h1)) inst0 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst7_Q), .Q(inst0_Q));
FDRSE #(.INIT(1'h0)) inst1 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst0_Q), .Q(inst1_Q));
FDRSE #(.INIT(1'h0)) inst2 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst1_Q), .Q(inst2_Q));
FDRSE #(.INIT(1'h0)) inst3 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst2_Q), .Q(inst3_Q));
FDRSE #(.INIT(1'h0)) inst4 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst3_Q), .Q(inst4_Q));
FDRSE #(.INIT(1'h0)) inst5 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst4_Q), .Q(inst5_Q));
FDRSE #(.INIT(1'h0)) inst6 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst5_Q), .Q(inst6_Q));
FDRSE #(.INIT(1'h0)) inst7 (.C(CLK), .CE(CE), .R(1'b0), .S(1'b0), .D(inst6_Q), .Q(inst7_Q));
assign O = {inst7_Q,inst6_Q,inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module main (output [7:0] LED, input  CLKIN);
wire [8:0] inst0_O;
wire  inst1_O;
wire [8:0] inst2_O;
wire  inst3_O;
wire [8:0] inst4_O;
wire  inst5_O;
wire [8:0] inst6_O;
wire  inst7_O;
wire [8:0] inst8_O;
wire  inst9_O;
wire [8:0] inst10_O;
wire  inst11_O;
wire [6:0] inst12_O;
wire  inst13_O;
wire [7:0] inst14_O;
Ring9CE_0001 inst0 (.O(inst0_O), .CLK(CLKIN), .CE(1'b1));
And2 inst1 (.I({inst0_O[8],1'b1}), .O(inst1_O));
Ring9CE_0001 inst2 (.O(inst2_O), .CLK(CLKIN), .CE(inst1_O));
And2 inst3 (.I({inst2_O[8],inst1_O}), .O(inst3_O));
Ring9CE_0001 inst4 (.O(inst4_O), .CLK(CLKIN), .CE(inst3_O));
And2 inst5 (.I({inst4_O[8],inst3_O}), .O(inst5_O));
Ring9CE_0001 inst6 (.O(inst6_O), .CLK(CLKIN), .CE(inst5_O));
And2 inst7 (.I({inst6_O[8],inst5_O}), .O(inst7_O));
Ring9CE_0001 inst8 (.O(inst8_O), .CLK(CLKIN), .CE(inst7_O));
And2 inst9 (.I({inst8_O[8],inst7_O}), .O(inst9_O));
Ring9CE_0001 inst10 (.O(inst10_O), .CLK(CLKIN), .CE(inst9_O));
And2 inst11 (.I({inst10_O[8],inst9_O}), .O(inst11_O));
Ring7CE_0001 inst12 (.O(inst12_O), .CLK(CLKIN), .CE(inst11_O));
And2 inst13 (.I({inst12_O[6],inst11_O}), .O(inst13_O));
Ring8CE_0001 inst14 (.O(inst14_O), .CLK(CLKIN), .CE(inst13_O));
assign LED = inst14_O;
endmodule

