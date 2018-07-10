module Johnson2 (output [1:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_O;
FDRSE #(.INIT(1'h0)) inst0 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(inst2_O), .Q(inst0_Q));
FDRSE #(.INIT(1'h0)) inst1 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(inst0_Q), .Q(inst1_Q));
LUT1 #(.INIT(2'h1)) inst2 (.I0(inst1_Q), .O(inst2_O));
assign O = {inst1_Q,inst0_Q};
endmodule

module main (output [1:0] LED, input  CLKIN);
wire [1:0] inst0_O;
Johnson2 inst0 (.O(inst0_O), .CLK(CLKIN));
assign LED = inst0_O;
endmodule

