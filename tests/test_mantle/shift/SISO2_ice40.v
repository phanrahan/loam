module SISO2 (input  I, output  O, input  CLK);
wire  inst0_Q;
wire  inst1_Q;
SB_DFF inst0 (.C(CLK), .D(I), .Q(inst0_Q));
SB_DFF inst1 (.C(CLK), .D(inst0_Q), .Q(inst1_Q));
assign O = inst1_Q;
endmodule

module main (input  J1, output  J3, input  CLKIN);
wire  inst0_O;
SISO2 inst0 (.I(J1), .O(inst0_O), .CLK(CLKIN));
assign J3 = inst0_O;
endmodule

