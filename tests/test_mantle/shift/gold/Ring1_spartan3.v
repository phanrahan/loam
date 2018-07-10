module Ring1_0001 (output [0:0] O, input  CLK);
wire  inst0_Q;
FDRSE #(.INIT(1'h1)) inst0 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(inst0_Q), .Q(inst0_Q));
assign O = {inst0_Q};
endmodule

module main (output  LED, input  CLKIN);
wire [0:0] inst0_O;
Ring1_0001 inst0 (.O(inst0_O), .CLK(CLKIN));
assign LED = inst0_O[0];
endmodule

