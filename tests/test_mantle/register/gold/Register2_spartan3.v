module Register2 (input [1:0] I, output [1:0] O, input  CLK);
wire  inst0_Q;
wire  inst1_Q;
FDRSE #(.INIT(1'h0)) inst0 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[0]), .Q(inst0_Q));
FDRSE #(.INIT(1'h0)) inst1 (.C(CLK), .CE(1'b1), .R(1'b0), .S(1'b0), .D(I[1]), .Q(inst1_Q));
assign O = {inst1_Q,inst0_Q};
endmodule

module main (output [1:0] LED, input  CLKIN, input [1:0] SWITCH);
wire [1:0] inst0_O;
Register2 inst0 (.I(SWITCH), .O(inst0_O), .CLK(CLKIN));
assign LED = inst0_O;
endmodule

