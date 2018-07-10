module Invert3 (input [2:0] I, output [2:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
LUT1 #(.INIT(2'h1)) inst0 (.I0(I[0]), .O(inst0_O));
LUT1 #(.INIT(2'h1)) inst1 (.I0(I[1]), .O(inst1_O));
LUT1 #(.INIT(2'h1)) inst2 (.I0(I[2]), .O(inst2_O));
assign O = {inst2_O,inst1_O,inst0_O};
endmodule

module main (output [2:0] LED, input [2:0] SWITCH);
wire [2:0] inst0_O;
Invert3 inst0 (.I(SWITCH), .O(inst0_O));
assign LED = inst0_O;
endmodule

