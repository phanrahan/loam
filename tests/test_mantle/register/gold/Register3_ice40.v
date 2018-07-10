module Register3 (input [2:0] I, output [2:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
SB_DFF inst0 (.C(CLK), .D(I[0]), .Q(inst0_Q));
SB_DFF inst1 (.C(CLK), .D(I[1]), .Q(inst1_Q));
SB_DFF inst2 (.C(CLK), .D(I[2]), .Q(inst2_Q));
assign O = {inst2_Q,inst1_Q,inst0_Q};
endmodule

module main (input [2:0] J1, output [2:0] J3, input  CLKIN);
wire [2:0] inst0_O;
Register3 inst0 (.I(J1), .O(inst0_O), .CLK(CLKIN));
assign J3 = inst0_O;
endmodule

