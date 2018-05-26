module Add24_cout (input [23:0] I0, input [23:0] I1, output [23:0] O, output  COUT);
wire [24:0] inst0_out;
coreir_add25 inst0 (.in0({1'b0,I0[23],I0[22],I0[21],I0[20],I0[19],I0[18],I0[17],I0[16],I0[15],I0[14],I0[13],I0[12],I0[11],I0[10],I0[9],I0[8],I0[7],I0[6],I0[5],I0[4],I0[3],I0[2],I0[1],I0[0]}), .in1({1'b0,I1[23],I1[22],I1[21],I1[20],I1[19],I1[18],I1[17],I1[16],I1[15],I1[14],I1[13],I1[12],I1[11],I1[10],I1[9],I1[8],I1[7],I1[6],I1[5],I1[4],I1[3],I1[2],I1[1],I1[0]}), .out(inst0_out));
assign O = {inst0_out[23],inst0_out[22],inst0_out[21],inst0_out[20],inst0_out[19],inst0_out[18],inst0_out[17],inst0_out[16],inst0_out[15],inst0_out[14],inst0_out[13],inst0_out[12],inst0_out[11],inst0_out[10],inst0_out[9],inst0_out[8],inst0_out[7],inst0_out[6],inst0_out[5],inst0_out[4],inst0_out[3],inst0_out[2],inst0_out[1],inst0_out[0]};
assign COUT = inst0_out[24];
endmodule

module DFF_init0_has_ceFalse_has_resetFalse (input  I, output  O, input  CLK);
wire [0:0] inst0_out;
coreir_reg_P #(.init(<coreir.type.BitVector object at 0x109ae6278>)) inst0 (.in({I}), .clk(CLK), .out(inst0_out));
assign O = inst0_out[0];
endmodule

module Register24 (input [23:0] I, output [23:0] O, input  CLK);
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
wire  inst12_O;
wire  inst13_O;
wire  inst14_O;
wire  inst15_O;
wire  inst16_O;
wire  inst17_O;
wire  inst18_O;
wire  inst19_O;
wire  inst20_O;
wire  inst21_O;
wire  inst22_O;
wire  inst23_O;
DFF_init0_has_ceFalse_has_resetFalse inst0 (.I(I[0]), .O(inst0_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst1 (.I(I[1]), .O(inst1_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst2 (.I(I[2]), .O(inst2_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst3 (.I(I[3]), .O(inst3_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst4 (.I(I[4]), .O(inst4_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst5 (.I(I[5]), .O(inst5_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst6 (.I(I[6]), .O(inst6_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst7 (.I(I[7]), .O(inst7_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst8 (.I(I[8]), .O(inst8_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst9 (.I(I[9]), .O(inst9_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst10 (.I(I[10]), .O(inst10_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst11 (.I(I[11]), .O(inst11_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst12 (.I(I[12]), .O(inst12_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst13 (.I(I[13]), .O(inst13_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst14 (.I(I[14]), .O(inst14_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst15 (.I(I[15]), .O(inst15_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst16 (.I(I[16]), .O(inst16_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst17 (.I(I[17]), .O(inst17_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst18 (.I(I[18]), .O(inst18_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst19 (.I(I[19]), .O(inst19_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst20 (.I(I[20]), .O(inst20_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst21 (.I(I[21]), .O(inst21_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst22 (.I(I[22]), .O(inst22_O), .CLK(CLK));
DFF_init0_has_ceFalse_has_resetFalse inst23 (.I(I[23]), .O(inst23_O), .CLK(CLK));
assign O = {inst23_O,inst22_O,inst21_O,inst20_O,inst19_O,inst18_O,inst17_O,inst16_O,inst15_O,inst14_O,inst13_O,inst12_O,inst11_O,inst10_O,inst9_O,inst8_O,inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module Counter24 (output [23:0] O, output  COUT, input  CLK);
wire [23:0] inst0_O;
wire  inst0_COUT;
wire [23:0] inst1_O;
Add24_cout inst0 (.I0(inst1_O), .I1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}), .O(inst0_O), .COUT(inst0_COUT));
Register24 inst1 (.I(inst0_O), .O(inst1_O), .CLK(CLK));
assign O = inst1_O;
assign COUT = inst0_COUT;
endmodule

module main (output  PIN4, input  CLKIN);
wire [23:0] inst0_O;
wire  inst0_COUT;
Counter24 inst0 (.O(inst0_O), .COUT(inst0_COUT), .CLK(CLKIN));
assign PIN4 = inst0_O[23];
endmodule

