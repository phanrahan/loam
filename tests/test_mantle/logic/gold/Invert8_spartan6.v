module Invert8 (input [7:0] I, output [7:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
LUT1 #(.INIT(2'h1)) inst0 (.I0(I[0]), .O(inst0_O));
LUT1 #(.INIT(2'h1)) inst1 (.I0(I[1]), .O(inst1_O));
LUT1 #(.INIT(2'h1)) inst2 (.I0(I[2]), .O(inst2_O));
LUT1 #(.INIT(2'h1)) inst3 (.I0(I[3]), .O(inst3_O));
LUT1 #(.INIT(2'h1)) inst4 (.I0(I[4]), .O(inst4_O));
LUT1 #(.INIT(2'h1)) inst5 (.I0(I[5]), .O(inst5_O));
LUT1 #(.INIT(2'h1)) inst6 (.I0(I[6]), .O(inst6_O));
LUT1 #(.INIT(2'h1)) inst7 (.I0(I[7]), .O(inst7_O));
assign O = {inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module main (output [7:0] LED, input [7:0] SWITCH);
wire [7:0] inst0_O;
Invert8 inst0 (.I(SWITCH), .O(inst0_O));
assign LED = inst0_O;
endmodule

