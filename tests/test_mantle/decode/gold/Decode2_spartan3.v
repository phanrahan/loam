module Decode2 (input [1:0] I, output  O);
wire  inst0_O;
LUT2 #(.INIT(4'h1)) inst0 (.I0(I[0]), .I1(I[1]), .O(inst0_O));
assign O = inst0_O;
endmodule

module main (output  LED, input [1:0] SWITCH);
wire  inst0_O;
Decode2 inst0 (.I(SWITCH), .O(inst0_O));
assign LED = inst0_O;
endmodule

