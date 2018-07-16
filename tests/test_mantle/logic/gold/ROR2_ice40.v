module Mux2 (input [1:0] I, input  S, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .I3(1'b0), .O(inst0_O));
assign O = inst0_O;
endmodule

module ROR2_1 (input [1:0] I, input  S, output [1:0] O);
wire  inst0_O;
wire  inst1_O;
Mux2 inst0 (.I(I), .S(S), .O(inst0_O));
Mux2 inst1 (.I({I[0],I[1]}), .S(S), .O(inst1_O));
assign O = {inst1_O,inst0_O};
endmodule

module ROR2 (input [1:0] I, input [0:0] S, output [1:0] O);
wire [1:0] inst0_O;
ROR2_1 inst0 (.I(I), .S(S[0]), .O(inst0_O));
assign O = inst0_O;
endmodule

module main (input [2:0] J1, output [1:0] J3);
wire [1:0] inst0_O;
ROR2 inst0 (.I({J1[1],J1[0]}), .S({J1[2]}), .O(inst0_O));
assign J3 = inst0_O;
endmodule

