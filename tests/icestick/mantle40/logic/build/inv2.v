module Invert2 (input [1:0] I, output [1:0] O);
wire  inst0_O;
wire  inst1_O;
SB_LUT4 #(.LUT_INIT(16'h5555)) inst0 (.I0(I[0]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst0_O));
SB_LUT4 #(.LUT_INIT(16'h5555)) inst1 (.I0(I[1]), .I1(1'b0), .I2(1'b0), .I3(1'b0), .O(inst1_O));
assign O = {inst1_O,inst0_O};
endmodule

module main (input [1:0] J1, output [1:0] J3);
wire [1:0] inst0_O;
Invert2 inst0 (.I(J1), .O(inst0_O));
assign J3 = inst0_O;
endmodule

