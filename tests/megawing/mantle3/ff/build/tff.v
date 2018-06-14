module main (output  LED, input  CLKIN, input  SWITCH);
wire  inst0_Q;
wire  inst1_O;
FDRSE #(.INIT(1'h0)) inst0 (.C(CLKIN), .CE(1'b1), .R(1'b0), .S(1'b0), .D(inst1_O), .Q(inst0_Q));
LUT2 #(.INIT(4'h6)) inst1 (.I0(inst0_Q), .I1(SWITCH), .O(inst1_O));
assign LED = inst0_Q;
endmodule

