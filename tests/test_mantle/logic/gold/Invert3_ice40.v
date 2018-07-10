module Invert3 (input [2:0] I, output [2:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
SB_LUT4 #(.LUT_INIT(16'h5555)) inst0 (.I0(I[0]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst0_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst1 (.I0(I[1]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst2 (.I0(I[2]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst2_O));
assign O = {inst2_O,inst1_O,inst0_O};
endmodule

module main (input [2:0] J1, output [2:0] J3);
wire [2:0] inst0_O;
Invert3 inst0 (.I(J1), .O(inst0_O));
assign J3 = inst0_O;
endmodule

