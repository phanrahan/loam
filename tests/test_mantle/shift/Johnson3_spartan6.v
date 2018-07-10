module Johnson3 (output [2:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_O;
FDRSE #(.INIT(1'h0)) inst0 (.CE(1'b1), .R(1'b0), .S(1'b0), .D(inst3_O), .Q(inst0_Q));
FDRSE #(.INIT(1'h0)) inst1 (.CE(1'b1), .R(1'b0), .S(1'b0), .D(inst0_Q), .Q(inst1_Q));
FDRSE #(.INIT(1'h0)) inst2 (.CE(1'b1), .R(1'b0), .S(1'b0), .D(inst1_Q), .Q(inst2_Q));
LUT1 #(.INIT(2'h1)) inst3 (.I0(inst2_Q), .O(inst3_O));
assign O = {inst2_Q,inst1_Q,inst0_Q};
endmodule

module main (output [2:0] LED, input  CLKIN);
wire [2:0] inst0_O;
Johnson3 inst0 (.O(inst0_O), .CLK(CLKIN));
assign LED = inst0_O;
endmodule

