module XOr2 (input [1:0] I, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'h6666)) inst0 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(inst0_O));
assign O = inst0_O;
endmodule

module XOr2x4 (input [3:0] I0, input [3:0] I1, output [3:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
XOr2 inst0 (.I({I1[0],I0[0]}), .O(inst0_O));
XOr2 inst1 (.I({I1[1],I0[1]}), .O(inst1_O));
XOr2 inst2 (.I({I1[2],I0[2]}), .O(inst2_O));
XOr2 inst3 (.I({I1[3],I0[3]}), .O(inst3_O));
assign O = {inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module main (input [7:0] J1, output [3:0] J3);
wire [3:0] inst0_O;
XOr2x4 inst0 (.I0({J1[3],J1[2],J1[1],J1[0]}), .I1({J1[7],J1[6],J1[5],J1[4]}), .O(inst0_O));
assign J3 = inst0_O;
endmodule

