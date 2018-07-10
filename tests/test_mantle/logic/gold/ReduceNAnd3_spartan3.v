module NAnd3 (input [2:0] I, output  O);
wire  inst0_O;
LUT3 #(.INIT(8'h80)) inst0 (.I0(I[0]), .I1(I[1]), .I2(I[2]), .O(inst0_O));
assign O = inst0_O;
endmodule

module main (output  LED, input [2:0] SWITCH);
wire  inst0_O;
NAnd3 inst0 (.I(SWITCH), .O(inst0_O));
assign LED = inst0_O;
endmodule

