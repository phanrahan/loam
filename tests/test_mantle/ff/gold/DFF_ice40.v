module main (input  J1, output  J3, input  CLKIN);
wire  inst0_Q;
SB_DFF inst0 (.C(CLKIN), .D(J1), .Q(inst0_Q));
assign J3 = inst0_Q;
endmodule

