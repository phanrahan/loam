module Invert4 (input [3:0] I, output [3:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
LUT1 #(.INIT(2'h1)) inst0 (.I0(I[0]), .O(inst0_O));
LUT1 #(.INIT(2'h1)) inst1 (.I0(I[1]), .O(inst1_O));
LUT1 #(.INIT(2'h1)) inst2 (.I0(I[2]), .O(inst2_O));
LUT1 #(.INIT(2'h1)) inst3 (.I0(I[3]), .O(inst3_O));
assign O = {inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module main (output [3:0] LED, input [3:0] SWITCH);
wire [3:0] inst0_O;
Invert4 inst0 (.I(SWITCH), .O(inst0_O));
assign LED = inst0_O;
endmodule

