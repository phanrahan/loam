module main (output  LED, input  SWITCH);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'h0002)) inst0 (.I0(SWITCH), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst0_O));
assign LED = inst0_O;
endmodule

