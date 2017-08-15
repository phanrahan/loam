module FullAdder (input  I0, input  I1, input  CIN, output  O, output  COUT);
wire  inst0_O;
wire  inst1_CO;
SB_LUT4 #(.LUT_INIT(16'h9696)) inst0 (.I0(I0), .I1(I1), .I2(CIN), .I3(1'b0), .O(inst0_O));
SB_CARRY inst1 (.I0(I0), .I1(I1), .CI(CIN), .CO(inst1_CO));
assign O = inst0_O;
assign COUT = inst1_CO;
endmodule

module Addcout9 (input [8:0] I0, input [8:0] I1, output [8:0] O, output  COUT);
wire  inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst1_COUT;
wire  inst2_O;
wire  inst2_COUT;
wire  inst3_O;
wire  inst3_COUT;
wire  inst4_O;
wire  inst4_COUT;
wire  inst5_O;
wire  inst5_COUT;
wire  inst6_O;
wire  inst6_COUT;
wire  inst7_O;
wire  inst7_COUT;
wire  inst8_O;
wire  inst8_COUT;
FullAdder inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(1'b0), .O(inst0_O), .COUT(inst0_COUT));
FullAdder inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(inst0_COUT), .O(inst1_O), .COUT(inst1_COUT));
FullAdder inst2 (.I0(I0[2]), .I1(I1[2]), .CIN(inst1_COUT), .O(inst2_O), .COUT(inst2_COUT));
FullAdder inst3 (.I0(I0[3]), .I1(I1[3]), .CIN(inst2_COUT), .O(inst3_O), .COUT(inst3_COUT));
FullAdder inst4 (.I0(I0[4]), .I1(I1[4]), .CIN(inst3_COUT), .O(inst4_O), .COUT(inst4_COUT));
FullAdder inst5 (.I0(I0[5]), .I1(I1[5]), .CIN(inst4_COUT), .O(inst5_O), .COUT(inst5_COUT));
FullAdder inst6 (.I0(I0[6]), .I1(I1[6]), .CIN(inst5_COUT), .O(inst6_O), .COUT(inst6_COUT));
FullAdder inst7 (.I0(I0[7]), .I1(I1[7]), .CIN(inst6_COUT), .O(inst7_O), .COUT(inst7_COUT));
FullAdder inst8 (.I0(I0[8]), .I1(I1[8]), .CIN(inst7_COUT), .O(inst8_O), .COUT(inst8_COUT));
assign O = {inst8_O,inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
assign COUT = inst8_COUT;
endmodule

module Register9 (input [8:0] I, output [8:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_Q;
wire  inst7_Q;
wire  inst8_Q;
SB_DFF inst0 (.C(CLK), .D(I[0]), .Q(inst0_Q));
SB_DFF inst1 (.C(CLK), .D(I[1]), .Q(inst1_Q));
SB_DFF inst2 (.C(CLK), .D(I[2]), .Q(inst2_Q));
SB_DFF inst3 (.C(CLK), .D(I[3]), .Q(inst3_Q));
SB_DFF inst4 (.C(CLK), .D(I[4]), .Q(inst4_Q));
SB_DFF inst5 (.C(CLK), .D(I[5]), .Q(inst5_Q));
SB_DFF inst6 (.C(CLK), .D(I[6]), .Q(inst6_Q));
SB_DFF inst7 (.C(CLK), .D(I[7]), .Q(inst7_Q));
SB_DFF inst8 (.C(CLK), .D(I[8]), .Q(inst8_Q));
assign O = {inst8_Q,inst7_Q,inst6_Q,inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module Counter9 (output [8:0] O, output  COUT, input  CLK);
wire [8:0] inst0_O;
wire  inst0_COUT;
wire [8:0] inst1_O;
Addcout9 inst0 (.I0(inst1_O), .I1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}), .O(inst0_O), .COUT(inst0_COUT));
Register9 inst1 (.I(inst0_O), .O(inst1_O), .CLK(CLK));
assign O = inst1_O;
assign COUT = inst0_COUT;
endmodule

module main (output  D5, output  D4, output  D3, output  D2, output  D1, input  CLKIN, output  DSR, output  CTS);
wire  inst0_O;
wire [15:0] inst1_RDATA;
wire [8:0] inst2_O;
wire  inst2_COUT;
wire  inst3_O;
wire  inst4_O;
wire  inst5_Q;
wire  inst6_O;
wire  inst7_Q;
wire  inst8_O;
SB_LUT4 #(.LUT_INIT(16'hFEFE)) inst0 (.I0(inst1_RDATA[0]), .I1(inst1_RDATA[2]), .I2(inst1_RDATA[4]), .I3(1'b0), .O(inst0_O));
SB_RAM40_4K #(.INIT_0(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.INIT_1(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.INIT_2(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.INIT_3(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.INIT_4(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.INIT_5(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.INIT_6(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.INIT_7(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.INIT_8(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.INIT_9(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.INIT_A(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.INIT_B(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.INIT_C(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.INIT_D(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.INIT_E(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.INIT_F(256'h00FF00FC00F300F000CF00CC00C3000000FF00FC00F300F000CF00CC00C30000),
.READ_MODE(1),
.WRITE_MODE(1)) inst1 (.RDATA(inst1_RDATA), .RADDR({1'b0,1'b0,inst2_O[8],inst2_O[7],inst2_O[6],inst2_O[5],inst2_O[4],inst2_O[3],inst2_O[2],inst2_O[1],inst2_O[0]}), .RCLK(CLKIN), .RCLKE(1'b1), .RE(1'b1), .WCLK(CLKIN), .WCLKE(1'b0), .WE(1'b0), .WADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .MASK({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .WDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
Counter9 inst2 (.O(inst2_O), .COUT(inst2_COUT), .CLK(CLKIN));
SB_LUT4 #(.LUT_INIT(16'h6666)) inst3 (.I0(inst0_O), .I1(inst1_RDATA[6]), .I2(1'b0), .I3(1'b0), .O(inst3_O));
SB_LUT4 #(.LUT_INIT(16'hEEEE)) inst4 (.I0(inst3_O), .I1(inst5_Q), .I2(1'b0), .I3(1'b0), .O(inst4_O));
SB_DFF inst5 (.C(CLKIN), .D(inst4_O), .Q(inst5_Q));
SB_LUT4 #(.LUT_INIT(16'hEEEE)) inst6 (.I0(inst2_COUT), .I1(inst7_Q), .I2(1'b0), .I3(1'b0), .O(inst6_O));
SB_DFF inst7 (.C(CLKIN), .D(inst6_O), .Q(inst7_Q));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst8 (.I0(inst5_Q), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst8_O));
assign D5 = inst8_O;
assign D4 = inst7_Q;
assign D3 = inst7_Q;
assign D2 = inst5_Q;
assign D1 = inst5_Q;
assign DSR = inst7_Q;
assign CTS = inst5_Q;
endmodule

