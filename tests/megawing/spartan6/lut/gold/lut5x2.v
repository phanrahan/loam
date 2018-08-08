module main (output [1:0] LED, input [5:0] SWITCH);
wire  inst0_O5;
wire  inst0_O6;
LUT6_2 #(.INIT(64'h55555555AAAAAAAA)) inst0 (.I0(SWITCH[0]), .I1(SWITCH[1]), .I2(SWITCH[2]), .I3(SWITCH[3]), .I4(SWITCH[4]), .I5(1'b1), .O5(inst0_O5), .O6(inst0_O6));
assign LED = {inst0_O6,inst0_O5};
endmodule

