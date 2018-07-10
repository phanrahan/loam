module Register1 (input [0:0] I, output [0:0] O, input  CLK);
wire  inst0_Q;
SB_DFF inst0 (.C(CLK), .D(I[0]), .Q(inst0_Q));
assign O = {inst0_Q};
endmodule

module main (input  J1, output  J3, input  CLKIN);
wire [0:0] inst0_O;
Register1 inst0 (.I({J1}), .O(inst0_O), .CLK(CLKIN));
assign J3 = inst0_O[0];
endmodule

