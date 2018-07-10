module Johnson1 (output [0:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_O;
FDRSE #(.INIT(1'h0)) inst0 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(inst1_O), .Q(inst0_Q));
LUT1 #(.INIT(2'h1)) inst1 (.I0(inst0_Q), .O(inst1_O));
assign O = {inst0_Q};
endmodule

module main (output  LED, input  CLKIN);
wire [0:0] inst0_O;
Johnson1 inst0 (.O(inst0_O), .CLK(CLKIN));
assign LED = inst0_O[0];
endmodule

