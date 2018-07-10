module Ring5_0001 (output [4:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
FDRSE #(.INIT(1'h1)) inst0 (.CE(1'b1), .R(1'b0), .S(1'b0), .D(inst4_Q), .Q(inst0_Q));
FDRSE #(.INIT(1'h0)) inst1 (.CE(1'b1), .R(1'b0), .S(1'b0), .D(inst0_Q), .Q(inst1_Q));
FDRSE #(.INIT(1'h0)) inst2 (.CE(1'b1), .R(1'b0), .S(1'b0), .D(inst1_Q), .Q(inst2_Q));
FDRSE #(.INIT(1'h0)) inst3 (.CE(1'b1), .R(1'b0), .S(1'b0), .D(inst2_Q), .Q(inst3_Q));
FDRSE #(.INIT(1'h0)) inst4 (.CE(1'b1), .R(1'b0), .S(1'b0), .D(inst3_Q), .Q(inst4_Q));
assign O = {inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module main (output [4:0] LED, input  CLKIN);
wire [4:0] inst0_O;
Ring5_0001 inst0 (.O(inst0_O), .CLK(CLKIN));
assign LED = inst0_O;
endmodule

