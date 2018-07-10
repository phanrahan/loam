module Register1 (input [0:0] I, output [0:0] O, input  CLK);
wire  inst0_Q;
FDRSE #(.INIT(1'h0)) inst0 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[0]), .Q(inst0_Q));
assign O = {inst0_Q};
endmodule

module main (output  LED, input  CLKIN, input  SWITCH);
wire [0:0] inst0_O;
Register1 inst0 (.I({SWITCH}), .O(inst0_O), .CLK(CLKIN));
assign LED = inst0_O[0];
endmodule

