module NE2 (input [1:0] I0, input [1:0] I1, output  O);
wire  inst0_O;
LUT4 #(.INIT(16'h6FF6)) inst0 (.I0(I0[0]), .I1(I1[0]), .I2(I0[1]), .I3(I1[1]), .O(inst0_O));
assign O = inst0_O;
endmodule

module main (output  LED, input [3:0] SWITCH);
wire  inst0_O;
NE2 inst0 (.I0({SWITCH[1],SWITCH[0]}), .I1({SWITCH[3],SWITCH[2]}), .O(inst0_O));
assign LED = inst0_O;
endmodule

