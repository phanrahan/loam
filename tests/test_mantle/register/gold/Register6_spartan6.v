module Register6 (input [5:0] I, output [5:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
FDRSE #(.INIT(1'h0)) inst0 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[0]), .Q(inst0_Q));
FDRSE #(.INIT(1'h0)) inst1 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[1]), .Q(inst1_Q));
FDRSE #(.INIT(1'h0)) inst2 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[2]), .Q(inst2_Q));
FDRSE #(.INIT(1'h0)) inst3 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[3]), .Q(inst3_Q));
FDRSE #(.INIT(1'h0)) inst4 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[4]), .Q(inst4_Q));
FDRSE #(.INIT(1'h0)) inst5 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[5]), .Q(inst5_Q));
assign O = {inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module main (output [5:0] LED, input [5:0] SWITCH, input  CLKIN);
wire [5:0] inst0_O;
Register6 inst0 (.I(SWITCH), .O(inst0_O), .CLK(CLKIN));
assign LED = inst0_O;
endmodule

