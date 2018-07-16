module Register6 (input [5:0] I, output [5:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
SB_DFF inst0 (.C(CLK), .D(I[0]), .Q(inst0_Q));
SB_DFF inst1 (.C(CLK), .D(I[1]), .Q(inst1_Q));
SB_DFF inst2 (.C(CLK), .D(I[2]), .Q(inst2_Q));
SB_DFF inst3 (.C(CLK), .D(I[3]), .Q(inst3_Q));
SB_DFF inst4 (.C(CLK), .D(I[4]), .Q(inst4_Q));
SB_DFF inst5 (.C(CLK), .D(I[5]), .Q(inst5_Q));
assign O = {inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module main (input [5:0] J1, output [5:0] J3, input  CLKIN);
wire [5:0] inst0_O;
Register6 inst0 (.I(J1), .O(inst0_O), .CLK(CLKIN));
assign J3 = inst0_O;
endmodule
