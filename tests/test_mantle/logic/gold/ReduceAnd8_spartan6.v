module And8 (input [7:0] I, output  O);
wire  inst0_O5;
wire  inst0_O6;
wire  inst1_O;
wire  inst2_O5;
wire  inst2_O6;
wire  inst3_O;
LUT6_2 #(.INIT(64'h8000800000000000)) inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .I4(1'b0), .I5(1'b1), .O5(inst0_O5), .O6(inst0_O6));
MUXCY inst1 (.DI(inst0_O5), .CI(1'b1), .S(inst0_O6), .O(inst1_O));
LUT6_2 #(.INIT(64'h8000800000000000)) inst2 (.I0(I[4]), .I1(I[5]), .I2(I[6]), .I3(I[7]), .I4(1'b0), .I5(1'b1), .O5(inst2_O5), .O6(inst2_O6));
MUXCY inst3 (.DI(inst2_O5), .CI(inst1_O), .S(inst2_O6), .O(inst3_O));
assign O = inst3_O;
endmodule

module main (output  LED, input [7:0] SWITCH);
wire  inst0_O;
And8 inst0 (.I(SWITCH), .O(inst0_O));
assign LED = inst0_O;
endmodule

