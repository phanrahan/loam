module SISO1 (input  I, output  O, input  CLK);
wire  inst0_Q;
SB_DFF inst0 (.C(CLK), .D(I), .Q(inst0_Q));
assign O = inst0_Q;
endmodule

module main (input  J1, output  J3, input  CLKIN);
wire  inst0_O;
SISO1 inst0 (.I(J1), .O(inst0_O), .CLK(CLKIN));
assign J3 = inst0_O;
endmodule

