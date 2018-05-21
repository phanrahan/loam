module EQ1 (input  I0, input  I1, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'h9999)) inst0 (.I0(I0), .I1(I1), .I2(1'b0), .I3(1'b0), .O(inst0_O));
assign O = inst0_O;
endmodule

module main (input  I, output  D1);
wire  inst0_O;
EQ1 inst0 (.I0(I), .I1(1'b1), .O(inst0_O));
assign D1 = inst0_O;
endmodule

